cd G:\GRUPO_BIGDATA\Proyecto_ESSNet Big Data II\Simulations\MobileNetworkDataSimulationTemplate\code\docker 
docker load -i G:\GRUPO_BIGDATA\Proyecto_ESSNet Big Data II\Simulations\MobileNetworkDataSimulationTemplate\code\docker\simulator.tar 
docker run --rm -v g:\grupo_bigdata\proyecto_essnet big data ii\simulations\mobilenetworkdatasimulationtemplate\code\docker\output:/repo/output -t -i simulator -m output/map.wkt -s output/simulation.xml -p output/persons.xml -a output/antennas.xml -v -o -pb output/probabilities.xml
