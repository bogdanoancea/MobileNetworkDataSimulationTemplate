The eventLocProb_dict.xml file describes the standardized structure of the csv files containing the event location probabilities for each device at each time instant.
The content of this file defines the following elements:

1. <eventLocationProbabilities>
This is the outermost element, it encloses the specificatons of other elements.
2. <specs_eventLocProbs>
This tag encloses the event location probabilities definition for a set of files sharing a common structure, comming from an MNO, and its parent is <eventLocationProbabilities>.
If there are several datasets with different structures a <specs_eventLocProbs> tag should be added for each dataset.
The <specs_eventLocProbs> contains the following tags:

2.1. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <specs_eventLocProbs>.
It contains at least one mandatory child element and one optional element:
a) <fileName> : mandatory, it gives the file name containing the actual data; the definition can be applied to several data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description of the files;

2.2. <specs_mno>
It specifies the MNO which provided this dataset and its parent is <specs_eventLocProbs>.
It contains one mandatory child element and one optional element:
a) <name> : mandatory, it gives MNO name;
b) <description> : an optional tag that can provide a textual description of the MNO;

2.3. <specs_device>
It enumerates the device IDs and its parent is <specs_eventLocProbs>.
It contains two mandatory child elements and one optional element:
a) <devColName> : mandatory, it gives the column name (in the csv file) of the device IDs;
b) <devID_value_type> : mandatory, it gives the type of the values of the device IDs and it supports the following values: string and integer;
c) <description> : an optional tag that can provide a textual description;


2.4. <specs_time type=...> 
It describes the timestamp variable and its parent is <specs_eventLocProbs>.
The attribute "type" can have one of the two values: "Discrete"  or "Continuous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following five mandatory child elements and one optional element:
a1) <timeColName> : mandatory, it gives the column name (in the csv file) of the time variable;
a2)	<time_start> : mandatory, it gives the value of the initial time instant as a floating point value;
a3)	<time_end> : mandatory, it gives the value of the final time instant as a floating point value;
a4) <time_increment> : mandatory, it gives the value of the time increment as a floating point value;
a5) <time_unit> : mandatory, it gives the value of the time unit and it can have of of the following values: s, m, h for seconds, minutes, hours;
a6) <description> : an optional tag that can provide a textual description for the timestamp variable;

b) type = "Continuous"
In this case the <specs_time> element will contain the following four mandatory child elements and one optional element:
b1) <timeColName> : mandatory, it gives the column name (in the csv file) of the time variable;
b2)	<time_start> : mandatory, it gives the value of the initial time instant as a floating point value;
b3)	<time_end> : mandatory, it gives the value of the final time instant as a floating point value;
b4) <time_unit> : mandatory, it gives the value time unit and it can have of of the following values: s, m, h for seconds, minutes, hours;
b5) <description> : an optional tag that can provide a textual description for the timestamp variable;


2.5. <specs_tile>
It enumerates the tile IDs and its parent is <specs_eventLocProbs>.
It contains two mandatory child elements and one optional element:
a) <tileColName> : mandatory, it gives the column name (in the csv file) of the tile IDs;
b) <tileID_value_type> : mandatory, it gives the data type of the tile IDs and it can be: unsignedInt, unsignedLong, nonNegativeInteger;
c) <description> : an optional tag that can provide a textual description;

2.6. <specs_cells>
It specifies the cell ID where the mobile device was detected at certain time instant and its parent is <specs_eventLocProbs>.
It contains two mandatory child elements and one optional elements.
a) <cellIDColName> : mandatory, it gives the cell ID where the mobile device was detected;
b) <cellID_value_type> : mandatory, it the data type of the cell IDs and it can be string or integer;
c) <description> : an optional tag that can provide a textual description;

2.7. <specs_prob >
It describes the method used to compute the event location probabilities of the devices 
and its parent is <specs_eventLocProbs>.
It contains three mandatory child elements and one optional element:
a) <probColName> : mandatory, it gives the column name (in the csv file) of the event location probability;
b) <method> : mandatory, it gives the method used to compute the event location probabilities and it could have two values: "RSS" or "SDM";
c) <prior> : mandatory, it gives the prior probability used to compute the event location probabilities and it could have two values: "network" or "uniform";
d) <description> : an optional tag that can provide a textual description;

