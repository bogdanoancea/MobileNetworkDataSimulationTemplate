The eventLocProb_dict.xml file describes the standardized structure of the csv files containing the event location probabilities for each device at each time instant.
The content of this file defines the following elements:

1. <eventLocationProbabilities>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <eventLocationProbabilities>.
It contains at least 1 mandatory child element and one optional element:
a) <fileName> : it gives the file name containing the actual data; the definition can be applied to several
data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description;

3. <specs_device>
It enumerates the device IDs and its parent is <eventLocationProbabilities>.
It contains 2 mandatory child elements and one optional element:
a) <devColName> : it gives the column name (in the csv file) of the device IDs;
b) <devIDValues> : it enumerates the device IDs as a list where the items are strings separated by white spaces;
c) <description> : an optional tag that can provide a textual description;

4. <specs_time type=...> 
It describes the time variable and its parent is <eventLocationProbabilities>.
The attribute type can have one of the two values: "Discrete"  or "Continous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following 5 mandatory child elements and one optional element:
a1) <timeColName> : it gives the column name (in the csv file) of the time variable;
a2)	<time_start> : it gives the value of the initial time instant as a floating point value
a3)	<time_end> : it gives the value of the final time instant as a floating point value
a4) <time_increment> : it gives the value of the final time instant as a floating point value
a5) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h
a6) <description> : an optional tag that can provide a textual description;

b) type = "Continous"
In this case the <specs_time> element will contain the following 4 mandatory child elements and one optional element:
b1) <timeColName> : it gives the column name (in the csv file) of the time variable;
b2)	<time_start> : it gives the value of the initial time instant as a floating point value;
b3)	<time_end> : it gives the value of the final time instant as a floating point value;
b4) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h;
b5) <description> : an optional tag that can provide a textual description;

5. <specs_tile>
It enumerates the tile IDs and its parent is <eventLocationProbabilities>.
It contains 2 mandatory child elements and one optional element:
a) <tileColName> : it gives the column name (in the csv file) of the tile IDs;
b) <tileIDValues> : it enumerates the tile IDs as a list where the items are unsigned integers separated by white spaces;
c) <description> : an optional tag that can provide a textual description;

6. <specs_event eventType = ...>
It describes the events captured by the network and its parent is <eventLocationProbabilities>.
The attribute eventType can have one of the two values: "CellID"  or "CellIDTA". In the first case a network event is 
represented by the ID of the cell where the mobile device was detected and in the second case, besides the ID of the cell
the time advancing variable (TA) is also stored by the network together with the cell type (to correctly interpret the value
of tha TA).

a) eventType = "CellID"
In this case the <specs_event> element will contain the following 2 mandatory child elements and one optional element:
a1) <cellIDColName> : it gives the column name (in the csv file) of the cell ID;
a2) <cellIDValues> : it enumerates the cell IDs as a list where the items are strings separated by white spaces;
a3) <description> : an optional tag that can provide a textual description;

b) eventType = "CellIDTA"
In this case the <specs_event> element will contain the following 6 mandatory child elements and one optional element:
b1) <cellIDColName> : it gives the column name (in the csv file) of the cell ID;
b2) <cellIDValues> : it enumerates the cell IDs as a list where the items are strings separated by white spaces;
b3) <TAColName> : it gives the column name (in the csv file) of the TA variable;
b4) <TAValues> : it enumerates the TA values as a list where the items are strings separated by white spaces;
b5) <cellTypeColName> : it gives the column name (in the csv file) of the cell type variable;
b6) <cellTypeValues> : it enumerates the possible values for the cell type; the only valid values are "3G" or "4G";
b7) <description> : an optional tag that can provide a textual description;

7. <specs_prob >
It describes the method used to compute the location probabilities of the devices 
and its parent is <eventLocationProbabilities>.
It contains 3 mandatory child elements and one optional element:
a) <probColName> : it gives the column name (in the csv file) of the event location probability;
b) <method> : it gives the method used to compute the event location probabilities and it could have two values: "RSS" or "SDM";
c) <prior> : it gives the prior probability used to compute the event location probabilities and it could have two values: "network" or "uniform";
d) <description> : an optional tag that can provide a textual description;

