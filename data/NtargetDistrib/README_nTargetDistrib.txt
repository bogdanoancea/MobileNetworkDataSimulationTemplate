The nTargetDistrib_dict.xml file describes the standardized structure of the csv files containing the random values generated for the 
distribution of target population count.
The content of this file defines the following elements:

1. <nTargetDistrib>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <nTargetDistrib>.
It contains at least one mandatory child element and one optional element:
a) <fileName> : mandatory, it gives the file name containing the actual data; the definition can be applied to several data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description of the files;

3. <specs_time type=...> 
It describes the timestamp variable of the network events and its parent is <nTargetDistrib>.
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


4. <specs_region>
It enumerates the region IDs and its parent is <nTargetDistrib>.
It contains two mandatory child elements and one optional element:
a) <regionColName> : it gives the column name (in the csv file) of the region IDs;
b) <regionID_value_type> :  mandatory, it gives the data type of the region IDs and it can be: unsignedInt, unsignedLong, nonNegativeInteger;;
c) <description> : an optional tag that can provide a textual description;


5. <specs_nTarget>
It specifies the column with the random values generated from the distribution of the target population count and its parent is <nTargetDistrib>.
It contains two mandatory child elements and one optional element:
a) <nTargetColName> : mandatory, it gives column namme of the random values generated from the distribution of the target population count;
b) <nTarget_value_type> : it specifies the type of the data on the column and it could take one of the following values: decimal or integer;
c) <description> : an optional tag that can provide a textual description;


6. <specs_iter>
It gives the index of the above mentioned random values and its parent is <nTargetDistrib>.
It contains two mandatory child elements and one optional element:
a) <iterColName> : mandatory, it gives the column name of the index;
b) <noIterValue> : mandatory, it specifies the number of random values generated for each region and each time instant;
c) <description> : an optional tag that can provide a textual description;

7. <specs_distr type = ...>
It gives the name of the distribution used to generate the random values and its parent is <nTargetDistrib>.
The attribute type can have one of the three values: "NegBin", "BetaNegBin" or "StateNegBin".
It contains one optional element:
a) <description> : an optional tag that can provide a textual description;
