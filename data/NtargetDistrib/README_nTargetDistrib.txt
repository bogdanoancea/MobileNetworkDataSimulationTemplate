The nTargetDistrib_dict.xml file describes the standardized structure of the csv files containing the random values generated for the 
distribution of target population count.
The content of this file defines the following elements:

1. <nTargetDistrib>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <nTargetDistrib>.
It contains at least 1 mandatory child element and one optional element:
a) <fileName> : it gives the file name containing the actual data; the definition can be applied to several
data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description;


3. <specs_time type=...> 
It describes the time variable and its parent is <nTargetDistrib>.
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


4. <specs_region>
It enumerates the region IDs and its parent is <nTarrgetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <regionColName> : it gives the column name (in the csv file) of the region IDs;
b) <regionIDValues> : it enumerates the region IDs as a list where the items are unsigned integers separated by white spaces;
c) <description> : an optional tag that can provide a textual description;


5. <specs_nTarget>
It specifies the column with the values of the random values generated from the distribution of the target population count; its parent is <nTargetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <nTargetColName> : it gives the random values generated from the distribution of the target population count;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;


6. <specs_iter>
It gives the index of the above mentioned random values; its parent is <nTargetDistrib>.
It contains 2 mandatory child elements and one optional element:
a) <iterColName> : it gives the column name of the index;
b) <noIterValue> : specifies the number of random values generated for each region and each time instant;
c) <description> : an optional tag that can provide a textual description;

7. <specs_distr type = ...>
It gives the name of the distribution used to geneerate the random values; its parent is <nTargetDistrib>.
The attribute type can have one of the three values: "NegBin", "BetaNegBin" or "StateNegBin".
It contains  one optional element:
a) <description> : an optional tag that can provide a textual description;
