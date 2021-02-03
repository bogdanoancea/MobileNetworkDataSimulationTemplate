The nNetDistrib_dict.xml file describes the standardized structure of the csv files containing the random values generated for the 
distribution of the number of individuals detected by the network.
The content of this file defines the following elements:

1. <nNetDistrib>
This is the outermost element, it encloses the specificatons of other elements.
2. <specs_time type=...> 
It describes the time variable and its parent is <nNetDistrib>.
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


2. <specs_region>
It enumerates the region IDs and its parent is <nNetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <regionColName> : it gives the column name (in the csv file) of the region IDs;
b) <regionIDValues> : it enumerates the region IDs as a list where the items are unsigned integers separated by white spaces;
c) <description> : an optional tag that can provide a textual description;


3. <specs_nNet>
It specifies the column with the values of the random values generated from the distribution of the number of 
individuals detected by the network; its parent is <nNetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <nNetColName> : it gives the random values generated from the distribution of the number of 
individuals detected by the network;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;


4. <specs_iter>
It gives the index of the above mentioned andom values; its parent is <nNetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <iterColName> : it gives the column name of the index;
b) <noIterValue> : specifies the number of random values generated for each region and each time instant;
c) <description> : an optional tag that can provide a textual description;
