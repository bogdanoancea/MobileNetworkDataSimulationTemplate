The postLocjointProb_dict.xml file describes the standardized structure of the csv files containing the posterior location probabilities for each device at each time instant.
The content of the postLocJointProb_dict.xml file defines the following elements:

1. <posteriorLocationJointProbabilities>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <posteriorLocationJointProbabilities>.
It contains at least one mandatory child element and one optional element:
a) <fileName> : mandatory, it gives the file name containing the actual data; the definition can be applied to several data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description of the files;

3. <specs_device>
It enumerates the device IDs and its parent is <posteriorLocationJointProbabilities>.
It contains two mandatory child elements and one optional element:
a) <devColName> : mandatory, it gives the column name (in the csv file) of the device IDs;
b) <devID_value_type> : mandatory, it gives the type of the values of the device IDs and it supports the following values: string and integer;
c) <description> : an optional tag that can provide a textual description;

4. <specs_time type=...> 
It describes the timestamp variable and its parent is <posteriorLocationJointProbabilities>.
The attribute type can have one of the two values: "Discrete"  or "Continous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following six mandatory child elements and one optional element:
a1) <timeFromColName> : mandatory, it gives the column name (in the csv file) of the intial time instant variable for a transition;
a2) <timeToColName> : mandatory, it gives the column name (in the csv file) of the final time variable for a transition;
a3)	<time_start> : mandatory, it gives the value of the initial time instant of the whole data set as a floating point value;
a4)	<time_end> : mandatory, it gives the value of the final time instant of the whole data set as a floating point value;
a5) <time_increment> : mandatory, it gives the value of the time increment as a floating point value;
a6) <time_unit> : mandatory, it gives the value time unit and it can have of of the following values: s, m, h for seconds, minutes, hours;
a7) <description> : an optional tag that can provide a textual description for the timestamp variable;


b) type = "Continuous"
In this case the <specs_time> element will contain the following five mandatory child elements and  one optional element:
b1) <timeFromColName> : mandatory, it gives the column name (in the csv file) of the intial time instant variable for a transition;
b2) <timeToColName> : mandatory, it gives the column name (in the csv file) of the final time variable for a transition;
b3)	<time_start> : mandatory, it gives the value of the initial time instant of the whole data set as a floating point value;
b4)	<time_end> : mandatory, it gives the value of the final time instant of the whole data set as a floating point value;
b5) <time_unit> : mandatory, it gives the value time unit and it can have of of the following values: s, m, h for seconds, minutes, hours;
b6) <description> : an optional tag that can provide a textual description for the timestamp variable;

5. <specs_tile>
It enumerates the tile IDs and its parent is <posteriorLocationJointProbabilities>.
It contains three mandatory child elements and one optional element:
a) <tileFromColName> : mandatory, it gives the column name (in the csv file) of the source tile ID for a transition;
b) <tileToColName> : mandatory, it gives the column name (in the csv file) of the destination tile ID for a transition;
c) <tileID_value_type> : mandatory, it gives the data type of the tile IDs and it can be: unsignedInt, unsignedLong, nonNegativeInteger;
d) <description> : an optional tag that can provide a textual description;

6. <specs_cells>
It specifies the cell ID where the mobile device was detected at certain time instant and its parent is <posteriorLocationJointProbabilities>.
It contains three mandatory child elements and one optional elements.
a) <cellIDFromColName> : mandatory, it gives the cell ID where the mobile device was detected at the initial time instant of a transition;
b) <cellIDToColName> : mandatory, it gives the cell ID where the mobile device was detected at the final time instant of a transition;
c) <cellID_value_type> : mandatory, it the data type of the cell IDs and it can be string or integer;
d) <description> : an optional tag that can provide a textual description;

7. <specs_prob >
It describes the method used to compute the joint location probabilities of the devices 
and its parent is <posteriorLocationJointProbabilities>.
It contains two mandatory child elements and one optional element:
a) <jointProbColName> : mandatory, it gives the column name (in the csv file) of the joint location probability;
b) <method name =...> : mandatory, it gives the method used to compute the joint location probabilities. The attribute "name" could have one of the two following values: "HMM" or "StaticBayes".
b1) name = "HMM"
In this case the <method> element will contain the following three mandatory child elements and one optional element:
b11) <prior> : mandatory, it gives the priors used to compute the joint location probabilities and it could have one of the following two values: "network" or "uniform";
b12) <transition> : mandatory, it gives the transition model used by the HMM and currently could have only a single value: "rectangle";
b13) <emission> : mandatory, it gives the method used to compute to emmision probabilities of the HMM and it could have one of the two following values: "RSS" or "SDM";
b14) <description> : an optional tag that can provide a textual description

b2) name = "StaticBayes"
In this case the <method> element will contain the one mandatory child element and one optional element:
b21) <prior> : mandatory, it gives the priors used to compute the joint location probabilities and it could have one of the following two values: "network" or "uniform";
b22) <description> : an optional tag that can provide a textual description;

c) <description> : an optional tag that can provide a textual description;

