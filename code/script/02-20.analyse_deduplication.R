####  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ####
####                           SET PATHS                                    ####
path_root         <- 'G:/GRUPO_BIGDATA/Proyecto_ESSNet Big Data II/Simulations/MobileNetworkDataSimulationTemplate'
path_source       <- file.path(path_root, 'code/src')
path_simConfig    <- file.path(path_root, 'data/simulatorConfig')
path_events       <- file.path(path_root, 'data/networkEvents')
path_eventLoc     <- file.path(path_root, 'data/eventLocProb')
path_resources    <- file.path(path_root, 'param/resources')
path_processParam <- file.path(path_root, 'param/process')
path_postLoc      <- file.path(path_root, 'data/postLocProb')
path_dupProb      <- file.path(path_root, 'data/dupProb')


####  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ####
####                  LOAD PACKAGES AND FUNCTIONS                           ####
library(data.table)
library(xml2)                 # to read simulatorConfig and parameters
library(tidyr)                # transform xml documents to tables (tibbles)
library(rgeos)                # spatial data
library(destim)
library(stringr)
library(ggplot2)              # graphics
library(pROC)                 # for ROC curve for duplicity test
library(deduplication)

# Function get_simConfig to read the input files of the simulator
source(file.path(path_source, 'get_simConfig.R'))
# Function get_simScenario to read the output files of the simulator
source(file.path(path_source, 'get_simScenario.R'))
# Function tileEquivalence to compute the equivalence between rastercell (R) and tiles (simulator)
source(file.path(path_source, 'tileEquivalence.R'))


####  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ####
####                           LOAD PARAMETERS                              ####
parameters.xml <- as_list(read_xml(file.path(path_processParam, "parameters_process.xml")))

emission_model    <- parameters.xml$process_parameters$geolocation$emission_model[[1]]
geolocation_prior <- parameters.xml$process_parameters$geolocation$prior[[1]]
method            <- parameters.xml$process_parameters$deduplication$method[[1]]
lambda            <- eval(parse(
  text = parameters.xml$process_parameters$deduplication$lambda[[1]]))

truePositions_person.dt <- fread(file.path(path_grTruth, 'truePositions_person.csv'))
truePositions_device.dt <- fread(file.path(path_grTruth, 'truePositions_device.csv'))
dupProbs.dt <- fread(file.path(path_dupProb, paste0('duplicity_', method, '_', emission_model, '-', geolocation_prior, '.csv')))
setnames(dupProbs.dt, c('device', 'dupProb'))

####  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ####
####          IDENTIFY REAL DUPLICATED DEVICES AND 2:1 DEVICES              ####

# Real Duplicities by device
tempDT     <- truePositions_person.dt[!is.na(device_2), .(personID, device_1, device_2)]
devIDs_dup <- sort(unique(unlist(tempDT[!duplicated(tempDT, by = 'personID'), .(device_1, device_2)])))

dupProbs.dt[
  device %chin% devIDs_dup, realDup := 1][
  is.na(realDup), realDup := 0][
  dupProb > 0.5 & realDup == "0", case := "FP"][
  dupProb <= 0.5 & realDup == "1", case := "FN"][
  dupProb <= 0.5 & realDup == "0", case := "TN"][
  dupProb > 0.5 & realDup == "1", case := "TP"][
  , method := method][
  , emission_model := emission_model][
  , geolocation_prior := geolocation_prior]

####  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ####
####          COMPARISON REAL VS. ESTIMATION WITH ROC                       ####

dupProb.roc <- roc(response = dupProbs.dt[, realDup],
                   predictor =  dupProbs.dt[, dupProb])
AUC1  <- pROC::auc(dupProb.roc)
thrsh <- coords(dupProb.roc, "best", ret = "threshold")
spec  <- coords(dupProb.roc, "best", ret = "spec")
sens  <- coords(dupProb.roc, "best", ret = "sens")

ggplot(dupProbs.dt, aes(x = dupProb, y = realDup, col = case)) +
  geom_jitter(width = 0, height = 0.15, cex=2) +
  labs(title =  '', x = '\nDevice-duplicity probability', y = 'Duplicity') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 22),
        axis.title.x = element_text(size = 18),
        axis.text.x = element_text(size = 13),
        axis.title.y = element_text(size = 18),
        axis.text.y = element_text(size = 13),
        legend.position = 'top', 
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))


FN_IDs <- dupProbs.dt[case == "FN", device]
events_FN.list <- lapply(FN_IDs, function(devID){events.dt[device == devID, antennaID]})
names(events_FN.list) <- FN_IDs
truePositions_FN.dt <- rbindlist(lapply(FN_IDs, function(devID){truePositions_device.dt[device == devID]}))


FP_IDs <- dupProbs.dt[case == "FP", device]
events_FP.list <- lapply(FP_IDs, function(devID){events.dt[device == devID, antennaID]})
names(events_FP.list) <- FP_IDs
truePositions_FP.dt <- rbindlist(lapply(FP_IDs, function(devID){truePositions_device.dt[device == devID]}))




####  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ####
####                            PLOT RESULTS                                ####
#### * Not FN corrected                                                     ####
ggplot(duplicity1to1.dt, aes(x = dupP, y = real_dup, col = case)) +
  geom_jitter(width = 0, height = 0.15, cex=2) +
  labs(title =  '', x = '\nDevice-duplicity probability', y = 'Duplicity') +
  facet_grid(model ~ prior) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 22),
        axis.title.x = element_text(size = 18),
        axis.text.x = element_text(size = 13),
        axis.title.y = element_text(size = 18),
        axis.text.y = element_text(size = 13),
        legend.position = 'top', 
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))

dupROC.list <- list(dupROC_RSS_uniform, dupROC_RSS_network, dupROC_SDM_uniform, dupROC_SDM_network)
names(dupROC.list) <- c('RSS_uniform', 'RSS_network', 'SDM_uniform', 'SDM_network')
AUC.dt <- data.table(auc = round(sapply(dupROC.list, pROC::auc), 4))[
  , model := c('RSS', 'RSS', 'SDM', 'SDM')][
    , prior := c('uniform', 'network', 'uniform', 'network')]

p1 <- ggroc(dupROC.list, size = 1.6) +
  geom_abline(slope = 1, intercept = 1, linetype = 'dotted', size = 1.3) +
  annotate("text", x = .25, y = .45, label = paste0('RSS_uniform: ', AUC.dt[1, auc]), size = 5) +
  annotate("text", x = .25, y = .35, label = paste0('RSS_network: ', AUC.dt[2, auc]), size = 5) +
  annotate("text", x = .25, y = .25, label = paste0('SDM_uniform: ', AUC.dt[3, auc]), size = 5) +
  annotate("text", x = .25, y = .15, label = paste0('SDM_network: ', AUC.dt[4, auc]), size = 5) +
  labs(title = '', x = '\n Specificity', y = 'Sensitivity\n') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 22),
        axis.title.x = element_text(size = 18),
        axis.text.x = element_text(size = 13),
        axis.title.y = element_text(size = 18),
        axis.text.y = element_text(size = 13),
        legend.position = 'top', 
        legend.title = element_blank(),
        legend.text = element_text(size = 10))
p1

#### * FN corrected                                                         ####
ggplot(duplicity1to1_FNcorrected.dt, aes(x = dupP, y = real_dup, col = case)) +
  geom_jitter(width = 0, height = 0.15, cex=2) +
  labs(title =  '', x = '\nDevice-duplicity probability', y = 'Duplicity') +
  facet_grid(model ~ prior) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 22),
        axis.title.x = element_text(size = 18),
        axis.text.x = element_text(size = 13),
        axis.title.y = element_text(size = 18),
        axis.text.y = element_text(size = 13),
        legend.position = 'top', 
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 10))

dupROC.list <- list(dupROC_RSS_uniform, dupROC_RSS_network, dupROC_SDM_uniform, dupROC_SDM_network)
names(dupROC.list) <- c('RSS_uniform', 'RSS_network', 'SDM_uniform', 'SDM_network')
AUC.dt <- data.table(auc = round(sapply(dupROC.list, pROC::auc), 4))[
  , model := c('RSS', 'RSS', 'SDM', 'SDM')][
    , prior := c('uniform', 'network', 'uniform', 'network')]

p1 <- ggroc(dupROC.list, size = 1.6) +
  geom_abline(slope = 1, intercept = 1, linetype = 'dotted', size = 1.3) +
  annotate("text", x = .25, y = .45, label = paste0('RSS_uniform: ', AUC.dt[1, auc]), size = 5) +
  annotate("text", x = .25, y = .35, label = paste0('RSS_network: ', AUC.dt[2, auc]), size = 5) +
  annotate("text", x = .25, y = .25, label = paste0('SDM_uniform: ', AUC.dt[3, auc]), size = 5) +
  annotate("text", x = .25, y = .15, label = paste0('SDM_network: ', AUC.dt[4, auc]), size = 5) +
  labs(title = '', x = '\n Specificity', y = 'Sensitivity\n') +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 22),
        axis.title.x = element_text(size = 18),
        axis.text.x = element_text(size = 13),
        axis.title.y = element_text(size = 18),
        axis.text.y = element_text(size = 13),
        legend.position = 'top', 
        legend.title = element_blank(),
        legend.text = element_text(size = 10))
p1
