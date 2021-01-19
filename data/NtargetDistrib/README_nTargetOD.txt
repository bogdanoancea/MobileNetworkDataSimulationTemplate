The nTargetOD_dict.xml file describes the standardized structure of the csv files containing the random values generated for the 
Origin-Destination matrices for the target population.
The content of this file defines the following elements:

1. <nTargetOD>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_time type=...> 
It describes the time variable and its parent is <nTargetOD>.
The attribute type can have one of the two values: "Discrete"  or "Continous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following 6 mandatory child elements and one optional element:
a1) <timeFromColName> : it gives the column name (in the csv file) of the initial time instant of a transition;
a2) <timeToColName> : it gives the column name (in the csv file) of the final time instant of a transition;
a3)	<time_start> : it gives the value of the initial time instant as a floating point value;
a4)	<time_end> : it gives the value of the final time instant as a floating point value;
a5) <time_increment> : it gives the value of the final time instant as a floating point value;
a6) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h
a7) <description> : an optional tag that can provide a textual description;

b) type = "Continous"
In this case the <specs_time> element will contain the following 5 mandatory child elements and one optional element:
b1) <timeFromColName> : it gives the column name (in the csv file) of the initial time instant of a transition;
b2) <timeToColName> : it gives the column name (in the csv file) of the final time instant of a transition;
b3)	<time_start> : it gives the value of the initial time instant as a floating point value;
b4)	<time_end> : it gives the value of the final time instant as a floating point value;
b5) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h;
b6) <description> : an optional tag that can provide a textual description;


3. <specs_region>
It gives the source and destination region IDs and its parent is <nTargetOD>.
It contains 3 mandatory child elements and one optional element:
a) <regionFromColName> : it gives the column name (in the csv file) of the source region IDs;
b) <regionToColName> : it gives the column name (in the csv file) of the destination region IDs;
c) <regionIDValues> : it enumerates the region IDs as a list where the items are unsigned integers separated by white spaces;
d) <description> : an optional tag that can provide a textual description;


4. <specs_nTargetOD>
It specifies the column with the values of the random values generated from the distribution of the number of 
individuals moving from one region to another; its parent is <nTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <nTargetODColName> : it gives the random values generated from the distribution of the number of 
individuals detected by the networkl
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;


5. <specs_iter>
It gives the index of the above mentioned random values; its parent is <nTargetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <iterColName> : it gives the column name of the index;
b) <noIterValue> : specifies the number of random values generated for each region and each time instant;
c) <description> : an optional tag that can provide a textual description;


6. <specs_distr type = ...>
It gives the name of the distribution used to generate the random values; its parent is <nTargetOD>.
The attribute type can have one of the three values: "NegBin", "BetaNegBin" or "StateNegBin".
It contains  one optional element:
a) <description> : an optional tag that can provide a textual description;
