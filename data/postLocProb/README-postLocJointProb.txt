The postLocjointProb_dict.xml file describes the standardized structure of the csv files containing the posterior location probabilities for each device at each time instant.
The content of the postLocJointProb_dict.xml file defines the following elements:

1. <posteriorLocationJointProbabilities>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_device>
It enumerates the device IDs and its parent is <posteriorLocationProbabilities>.
It contains 2 mandatory child elements and one optional element:
a) <devColName> : it gives the column name (in the csv file) of the device IDs;
b) <devIDValues> : it enumerates the device IDs as a list where the items are strings separated by white spaces;
c) <description> : an optional tag that can provide a textual description;

3. <specs_time type=...> 
It describes the time variable and its parent is <posteriorLocationJointProbabilities>.
The attribute type can have one of the two values: "Discrete"  or "Continous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following 6 mandatory child elements and one optional element:
a1) <timeFromColName> : it gives the column name (in the csv file) of the intial time instant variable for a transition;
a2) <timeToColName> : it gives the column name (in the csv file) of the final time variable for a transition;
a3)	<time_start> : it gives the value of the initial time instant of the whole data set as a floating point value;
a4)	<time_end> : it gives the value of the final time instant of the whole data set as a floating point value;
a5) <time_increment> : it gives the value of the final time instant as a floating point value;
a6) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h;
a7) <description> : an optional tag that can provide a textual description;


b) type = "Continous"
In this case the <specs_time> element will contain the following 5 mandatory child elements and  one optional element:
a1) <timeFromColName> : it gives the column name (in the csv file) of the intial time instant variable for a transition;
a2) <timeToColName> : it gives the column name (in the csv file) of the final time variable for a transition;
a3)	<time_start> : it gives the value of the initial time instant of the whole data set as a floating point value;
a4)	<time_end> : it gives the value of the final time instant of the whole data set as a floating point value;
a5) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h;
a6) <description> : an optional tag that can provide a textual description;

4. <specs_tile>
It enumerates the tile IDs and its parent is <posteriorLocationJointProbabilities>.
It contains 3 mandatory child elements and one optional element:
a) <tileFromColName> : it gives the column name (in the csv file) of the source tile ID for a transition;
b) <tileToColName> : it gives the column name (in the csv file) of the destination tile ID for a transition;
c) <tileIDValues> : it enumerates the tile IDs as a list where the items are unsigned integers separated by white spaces;
d) <description> : an optional tag that can provide a textual description;

5. <specs_event eventType = ...>
It describes the events captured by the network and its parent is <posteriorLocationJointProbabilities>.
The attribute eventType can have one of the two values: "CellID"  or "CellIDTA". In the first case a network event is 
represented by the ID of the cell where the mobile device was detected and in the second case, besides the ID of the cell
the time advancing variable (TA) is also stored by the network together with the cell type (to correctly interpret the value
of tha TA).

a) eventType = "CellID"
In this case the <specs_event> element will contain the following 3 mandatory child elements and one optional element:
a1) <cellIDFromColName> : it gives the column name (in the csv file) of the initial cell ID for a transition;
a2) <cellIDToColName> : it gives the column name (in the csv file) of the final cell ID for a transition;
a3) <cellIDValues> : it enumerates the cell IDs as a list where the items are strings separated by white spaces;
a4) <description> : an optional tag that can provide a textual description;

b) eventType = "CellIDTA"
In this case the <specs_event> element will contain the following 9 mandatory child elements and one optional element:
b1) <cellIDFromColName> : it gives the column name (in the csv file) of the initial cell ID for a transition;
b2) <cellIDToColName> : it gives the column name (in the csv file) of the final cell ID for a transition;
b3) <cellIDValues> : it enumerates the cell IDs as a list where the items are strings separated by white spaces;
b4) <TAFromColName> : it gives the column name (in the csv file) of the initial TA variable for a transition;
b5) <TAToColName> : it gives the column name (in the csv file) of the final TA variable for a transition;
b6) <TAValues> : it enumerates the TA values as a list where the items are strings separated by white spaces;
b7) <cellTypeFromColName> : it gives the column name (in the csv file) of the inital cell type variable for a transition;
b8) <cellTypeToColName> : it gives the column name (in the csv file) of the final cell type variable  for a transition;
b9) <cellTypeValues> : it enumerates the possible values for the cell type; the only valid values are "3G" or "4G";
b10) <description> : an optional tag that can provide a textual description;

6. <specs_prob >
It describes the method used to compute the location probabilities of the devices 
and its parent is <posteriorLocationJointProbabilities>.
It contains 2 mandatory child elements and one optional element:
a) <jointProbColName> : it gives the column name (in the csv file) of the joint location probability;
b) <method name =...>
c) <description> : an optional tag that can provide a textual description;

The <method> element describes the method used to compute the location probabilities of the mobile devices.
The attribute name could have one of the two following values: "HMM" or "StaticBayes".

b1) name = "HMM"
In this case the <method> element will contain the following 3 mandatory child elements and one optional element:
b11) <prior> : it gives the priors used to compute the location probabilities and it could have one of the following two values: "network" or "uniform";
b12) <transition> : it gives the transition model used by the HMM and currently could have onnly a single value: "rectangle";
b13) <emission> : it gives the method used to compute to emmision probabilities of the HMM and it could haveone of the two following values: "RSS" or "SDM";
b14) <description> : an optional tag that can provide a textual description

b2) name = "StaticBayes"
In this case the <method> element will contain the one mandatory child element and one optional element:
b21) <prior> : it gives the priors used to compute the location probabilities and it could have one of the following two values: "network" or "uniform";
b22) <description> : an optional tag that can provide a textual description;
