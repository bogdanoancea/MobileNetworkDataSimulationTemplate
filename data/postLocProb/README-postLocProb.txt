The postLocProb_dict.xml file describes the standardized structure of the csv files containing the posterior location probabilities for each device at each time instant.
The content of this file defines the following elements:

1. <posteriorLocationProbabilities>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_device>
It enumerates the device IDs and its parent is <posteriorLocationProbabilities>.
It contains 2 mandatory child elements:
a) <devColName> : it gives the column name (in the csv file) of the device IDs;
b) <devIDValues> : it enumerates the device IDs as a list where the items are strings separated by white spaces;

3. <specs_time type=...> 
It describes the time variable and its parent is <posteriorLocationProbabilities>.
The attribute type can have one of the two values: "Discrete"  or "Continous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following 5 mandatory child elements:
a1) <timeColName> : it gives the column name (in the csv file) of the time variable;
a2)	<time_start> : it gives the value of the initial time instant as a floating point value
a3)	<time_end> : it gives the value of the final time instant as a floating point value
a4) <time_increment> : it gives the value of the final time instant as a floating point value
a5) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h

b) type = "Continous"
In this case the <specs_time> element will contain the following 4 mandatory child elements:
a1) <timeColName> : it gives the column name (in the csv file) of the time variable;
a2)	<time_start> : it gives the value of the initial time instant as a floating point value;
a3)	<time_end> : it gives the value of the final time instant as a floating point value;
a4) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h;

4. <specs_tile>
It enumerates the tile IDs and its parent is <posteriorLocationProbabilities>.
It contains 2 mandatory child elements:
a) <tileColName> : it gives the column name (in the csv file) of the tile IDs;
b) <tileIDValues> : it enumerates the tile IDs as a list where the items are unsigned integers separated by white spaces;

5. <specs_event eventType = ...>
It describes the events captured by the network and its parent is <posteriorLocationProbabilities>.
The attribute eventType can have one of the two values: "CellID"  or "CellIDTA". In the first case a network event is 
represented by the ID of the cell where the mobile device was detected and in the second case, besides the ID of the cell
the time advancing variable (TA) is also stored by the network together with the cell type (to correctly interpret the value
of tha TA).

a) eventType = "CellID"
In this case the <specs_event> element will contain the following 2 mandatory child elements:
a1) <cellIDColName> : it gives the column name (in the csv file) of the cell ID;
a2) <cellIDValues> : it enumerates the cell IDs as a list where the items are strings separated by white spaces;

b) eventType = "CellIDTA"
In this case the <specs_event> element will contain the following 8 mandatory child elements:
b1) <cellIDColName> : it gives the column name (in the csv file) of the cell ID;
b2) <cellIDValues> : it enumerates the cell IDs as a list where the items are strings separated by white spaces;
b3) <TAColName> : it gives the column name (in the csv file) of the TA variable;
b4) <TAValues> : it enumerates the TA values as a list where the items are strings separated by white spaces;
b5) <cellTypeColName> : it gives the column name (in the csv file) of the cell type variable;
b6) <cellTypeValues> : it enumerates the possible values for the cell type; the only valid values are "3G" or "4G";

6. <specs_prob >
It describes the method used to compute the location probabilities of the devices 
and its parent is <posteriorLocationProbabilities>.
It contains 2 mandatory child elements:
a) <probColName> : it gives the column name (in the csv file) of the location probability;
b) <method name =...>
It describes method used to compute the location probabilities of the mobile devices.
the attribute name could have one of the two following values: "HMM" or "StaticBayes".

b1) name = "HMM"
In this case the <method> element will contain the following 3 mandatory child elements:
b11) <prior> : it gives the priors used to compute the location probabilities and it could have one of the following two values: "network" or "uniform";
b12) <transition> : it gives the transition model used by the HMM and currently could have onnly a single value: "rectangle";
b13) <emission> : it gives the method used to compute to emmision probabilities of the HMM and it could haveone of the two following values: "RSS" or "SDM";

b2) name = "StaticBayes"
In this case the <method> element will contain the one mandatory child element:
b21) <prior> : it gives the priors used to compute the location probabilities and it could have one of the following two values: "network" or "uniform";
