The nNetOD_dict.xml file describes the standardized structure of the csv files containing the random values generated for the Origin-Destination matrices.
The content of this file defines the following elements:

1. <nNetOD>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <nNetOD>.
It contains at least one mandatory child element and one optional element:
a) <fileName> : mandatory, it gives the file name containing the actual data; the definition can be applied to several data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description of the files;


3. <specs_time type=...> 
It describes the timestamp variable and its parent is <nNetOD>.
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


4. <specs_region>
It gives the source and destination region IDs and its parent is <nNetOD>.
It contains three mandatory child elements and one optional element:
a) <regionFromColName> : mandatory, it gives the column name (in the csv file) of the source region IDs;
b) <regionToColName> : mandatory, it gives the column name (in the csv file) of the destination region IDs;
c) <regionID_value_type> :  mandatory, it gives the data type of the region IDs and it can be: unsignedInt, unsignedLong, nonNegativeInteger;
d) <description> : an optional tag that can provide a textual description;


5. <specs_nNetOD>
It specifies the column with the random values generated from the distribution of the number of 
individuals moving from one region to another and its parent is <nNetOD>.
It contains two mandatory child elements and one optional element:
a) <nNetODColName> : mandatory, it gives the column name for the random values generated from the distribution of the number of individuals detected by the network;
b) <nNetODvalue_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;


6. <specs_iter>
It gives the index of the above mentioned random values; its parent is <nNetOD>.
It contains 2 mandatory child elements and one optional element:
It contains two mandatory child elements and one optional element:
a) <iterColName> : mandatory, it gives the column name of the index;
b) <noIterValue> : mandatory, it specifies the number of random values generated for each region and each time instant;
c) <description> : an optional tag that can provide a textual description;
