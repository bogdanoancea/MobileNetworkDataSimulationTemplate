The statNTargetOD_dict.xml file describes the standardized structure of the csv files containing different statistics of the OD matrices.
The content of this file defines the following elements:

1. <statNTargetOD>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <statNTargetOD>.
It contains at least 1 mandatory child element and one optional element:
a) <fileName> : it gives the file name containing the actual data; the definition can be applied to several
data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description;

3. <specs_time type=...> 
It describes the time variable and its parent is <statNTargetOD>.
The attribute type can have one of the two values: "Discrete"  or "Continous".
a) type = "Discrete"
In this case the <specs_time> element will contain the following 6 mandatory child elements and one optional element:
a1) <timeFromColName> : it gives the column name (in the csv file) of the initial time of a transition;
a2) <timeToColName> : it gives the column name (in the csv file) of the final time of a transition;
a3)	<time_start> : it gives the value of the initial time instant when recording of events started as a floating point value
a4)	<time_end> : it gives the value of the final time instant when recording of events started as a floating point value
a5) <time_increment> : it gives the value of the final time instant as a floating point value
a6) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h
a7) <description> : an optional tag that can provide a textual description;

b) type = "Continous"
In this case the <specs_time> element will contain the following 4 mandatory child elements and one optional element:
b1) <timeColName> : it gives the column name (in the csv file) of the time variable;
b2)	<time_start> : it gives the value of the initial time instant as a floating point value;
b3)	<time_end> : it gives the value of the final time instant as a floating point value;
b4) <time_unit> : it gives the value time unit and it can have of of the following values: s,m,h;
b5) <description> : an optional tag that can provide a textual description;


4. <specs_region>
It enumerates the region IDs and its parent is <statNTargetOD>.
It contains 3 mandatory child elements and one optional element:
a) <regionFromColName> : it gives the column name (in the csv file) of the source region IDs;
b) <regionToColName> : it gives the column name (in the csv file) of the destination region IDs;
c) <regionIDValues> : it enumerates the region IDs as a list where the items are unsigned integers separated by white spaces;
d) <description> : an optional tag that can provide a textual description;


5. <specs_mean>
It specifies the column with the mean value; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <meanColName> : it gives the column name (in the csv file) of the mean;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

6. <specs_mode>
It specifies the column with the mode value; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <modeColName> : it gives the column name (in the csv file) of the mode;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

7. <specs_median>
It specifies the column with the median value; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <medianColName> : it gives the column name (in the csv file) of the median;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;


8. <specs_min>
It specifies the column with the min value; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <minColName> : it gives the column name (in the csv file) of the min;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

9. <specs_max>
It specifies the column with the max value; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <maxColName> : it gives the column name (in the csv file) of the max;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

10. <specs_Q1>
It specifies the column with the first quartile; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <Q1ColName> : it gives the column name (in the csv file) of the first quartile;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

11. <specs_Q3>
It specifies the column with the third quartile; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <Q3ColName> : it gives the column name (in the csv file) of the third quartile;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

12. <specs_IQR>
It specifies the column with the inter quartile range; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <IQRColName> : it gives the column name (in the csv file) of the inter quartile range;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

13. <specs_sd>
It specifies the column with the standard deviation; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <sdColName> : it gives the column name (in the csv file) of the standard deviation;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

14. <specs_cv>
It specifies the column with the coefficient of variation; its parent is <statNTargetOD>.
It contains 2 mandatory child elements and one optional element:
a) <cvColName> : it gives the column name (in the csv file) of the coefficient of variation;
b) <value_type> : it specifies the type of the data on the column;
c) <description> : an optional tag that can provide a textual description;

15. <specs_CI>
It specifies the columns with the lower and upper value of the CI; its parent is <statNTargetOD>.
It contains 4 mandatory child elements and one optional element:
a) <CILOWColName> : it gives the column name (in the csv file) of the lower value of the CI;
b) <CIHIGHColName> : it gives the column name (in the csv file) of the upper value of the CI;
c) <value_type> : it specifies the type of the data on the column;
c) <method> : it specifies the method used to compute the CI; it could have one of the two values: 'ETI' or 'HDI';
d) <description> : an optional tag that can provide a textual description;

16. <specs_distr type = ...>
It gives the name of the distribution used to generate the random values; its parent is <statNTargetOD>.
The attribute type can have one of the three values: "NegBin", "BetaNegBin" or "StateNegBin".
It contains  one optional element:
a) <description> : an optional tag that can provide a textual description;
