The multProb_dict.xml file describes the standardized structure of the csv files containing the multiplicity probabilities for each device.
The content of this file defines the following elements:

1. <multiplicityProbabilities>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_file>
It enumerates the file names to which the definition applies, and its parent is <multiplicityProbabilities>.
It contains at least one mandatory child element and one optional element:
a) <fileName> : mandatory, it gives the file name containing the actual data; the definition can be applied to several data files and this tag should be specified for each data file;
b) <description> : an optional tag that can provide a textual description of the files;

3. <specs_device>
It enumerates the device IDs and its parent is <multiplicityProbabilities>.
It contains two mandatory child elements and one optional element:
a) <devColName> : mandatory, it gives the column name (in the csv file) of the device IDs;
b) <devID_value_type> : mandatory, it gives the type of the values of the device IDs and it supports the following values: string and integer;
c) <description> : an optional tag that can provide a textual description;

4. <specs_prob>
It describes the method used to compute the multiplicity probabilities of the devices 
and its parent is <multiplicityProbabilities>.
It contains a set mandatory child elements and optional elements:
a) <multiProb[2-9]> : mandatory, it gives the column name (in the csv file) of the multiplicity probability. There 
may be several such columns depending on how many devices an individual can carry. For example, if an individual can have 3 mobile devices
the xml file will contain 2 tags, multiProb2 and multiProb3, specifying the probability of having two respectively three devices. Currently, the 
methodological framework allows maximum two devices per individual.
b) <description> : an optional tag that can provide a textual description of a column;

5. <specs_method name = ...>
The specs_method element describes the method used to compute the mutiplicity probabilities of the mobile devices.
The attribute name could have one of the two following values: "OneToOne", or "oneToOneLambda", "Pairs", "Trajectory".

a1) name = "OneToOne"
It means that the multiplicy probability was computed using the 1-to-1 method and in this case the <specs_method> element 
will contain one mandatory child element and one optional element:
a11) <aprioriOneDevice> : mandatory, it gives the apriori probability for the mobile device to be in an 1-to-1 correspondence with its owner;
a12) <description> : an optional tag that can provide a textual description;

a2) name = "OneToOneLambda"
It means that the multiplicy probability was computed using the 1-to-1 with lambda parameter method and in this case the <specs_method> element 
will contain one mandatory child element and one optional element:
a21) <lambda> : mandatory, it gives the lambda parameter of this method;
a22) <description> : an optional tag that can provide a textual description;

a3) name = "Pairs"
It means that the multiplicy probability was computed using the pairs method and in this case the <specs_method> element 
will contain one mandatory child element and one optional element:
a31) <aprioriDupProb> : mandatory, it gives the apriori probability for the mobile device to be in an 2-to-1 correspondence with its owner;
a32) <description> : an optional tag that can provide a textual description;

a4) name = "Trajectory"
It means that the multiplicy probability was computed using the trajectory method and in this case the <specs_method> element 
will contain two mandatory child elements and one optional element:
a41) <aprioriDupProb> : mandatory, it gives the apriori probability for the mobile device to be in an 2-to-1 correspondence with its owner;
a41) <gamma> : it gives the apriori probability for an individual to have one mobile device;
a43) <description> : an optional tag that can provide a textual description;
