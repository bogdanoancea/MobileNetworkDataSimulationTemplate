The statNTarget_dict.xml file describes the standardized structure of the csv files containing different statistics of the distribution 
of target population count.
The content of this file defines the following elements:

1. <statNTarget>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <statNTarget>.
It contains at least one mandatory child element and one optional element:
a) <fileName> : mandatory, it gives the file name containing the actual data; the definition can be applied to several data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description of the files;


3. <specs_time type=...> 
It describes the timestamp variable of the network events and its parent is <statNTarget>.
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
It enumerates the region IDs and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <regionColName> : it gives the column name (in the csv file) of the region IDs;
b) <regionID_value_type> :  mandatory, it gives the data type of the region IDs and it can be: unsignedInt, unsignedLong, nonNegativeInteger;
c) <description> : an optional tag that can provide a textual description;


5. <specs_mean>
It specifies the column with the mean value and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <meanColName> : mandatory, it gives the column name (in the csv file) of the mean;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

6. <specs_mode>
It specifies the column with the mode value and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <modeColName> : mandatory, it gives the column name (in the csv file) of the mode;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

7. <specs_median>
It specifies the column with the median value and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <medianColName> : mandatory, it gives the column name (in the csv file) of the median;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;


8. <specs_min>
It specifies the column with the min value and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <minColName> : mandatory, it gives the column name (in the csv file) of the min;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

9. <specs_max>
It specifies the column with the max value and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <maxColName> : mandatory, it gives the column name (in the csv file) of the max;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : mandatory, an optional tag that can provide a textual description;

10. <specs_Q1>
It specifies the column with the first quartile and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <Q1ColName> : mandatory, it gives the column name (in the csv file) of the first quartile;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

11. <specs_Q3>
It specifies the column with the third quartile and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <Q3ColName> : mandatory, it gives the column name (in the csv file) of the third quartile;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

12. <specs_IQR>
It specifies the column with the inter quartile range and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <IQRColName> : mandatory, it gives the column name (in the csv file) of the inter quartile range;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

13. <specs_sd>
It specifies the column with the standard deviation and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <sdColName> : mandatory, it gives the column name (in the csv file) of the standard deviation;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

14. <specs_cv>
It specifies the column with the coefficient of variation and its parent is <statNTarget>.
It contains two mandatory child elements and one optional element:
a) <cvColName> : mandatory, it gives the column name (in the csv file) of the coefficient of variation;
b) <value_type> : mandatory, it specifies the type of the data on the column;
c) <description> : mandatory, an optional tag that can provide a textual description;

15. <specs_CI>
It specifies the columns with the lower and upper value of the CI and its parent is <statNTarget>.
It contains four mandatory child elements and one optional element:
a) <CILOWColName> : mandatory, it gives the column name (in the csv file) of the lower value of the CI;
b) <CIHIGHColName> : mandatory, it gives the column name (in the csv file) of the upper value of the CI;
c) <value_type> : mandatory, it specifies the type of the data on the column;
c) <method> : mandatory, it specifies the method used to compute the CI; it could have one of the two values: 'ETI' or 'HDI';
d) <description> : an optional tag that can provide a textual description;

16. <specs_distr type = ...>
It gives the name of the distribution used to generate the random values and its parent is <statNTarget>.
The attribute type can have one of the three values: "NegBin", "BetaNegBin" or "StateNegBin".
It contains  one optional element:
a) <description> : an optional tag that can provide a textual description;
