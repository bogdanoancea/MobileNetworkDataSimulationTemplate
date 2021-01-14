The multProb_dict.xml file describes the standardized structure of the csv files containing the multiplicity probabilities for each device.
The content of this file defines the following elements:

1. <multiplicityProbabilities>
This is the outermost element, it encloses the specificatons of other elements.

2. <specs_device>
It enumerates the device IDs and its parent is <mutiplicityProbabilities>.
It contains 2 mandatory child elements and one optional element:
a) <devColName> : it gives the column name (in the csv file) of the device IDs;
b) <devIDValues> : it enumerates the device IDs as a list where the items are strings separated by white spaces;
c) <description> : an optional tag that can provide a textual description;

3. <specs_prob>
It describes the method used to compute the multiplicity probabilities of the devices 
and its parent is <multiplicityProbabilities>.
It contains a set mandatory child elements and optional elements:
a) <multiProb[2-9]> : it gives the column name (in the csv file) of the multiplicity probability. There 
may be several such columns depending on how many devices an individual can carry. For example, if an individual can have 3 mobile devices
the xml file can contain 2 tags, multiProb2 and multiProb3, specifying the probability of having two respectively three devices. Currently, the 
methodological framework allows maximum two devices per individual.
b) <description> : an optional tag that can provide a textual description of a column;

4. <specs_method>
The specs_method element describes the method used to compute the mutiplicity probabilities of the mobile devices.
The attribute name could have one of the two following values: "OnetoOne", or "oneToOneLambda", "Pairs", "Trajectory".

a1) name = "OneToOne"
Means that the multiplicy probability was computed using the 1-to-1 method and in this case the <specs_method> element 
will contain one mandatory child elements and one optional element:
a11) <aprioriOneDevice> : it gives the apriori probability for the mobile device to be in an 1-to-1 correspondence with its owner;
a12) <description> : an optional tag that can provide a textual description;


a2) name = "OneToOneLambda"
Means that the multiplicy probability was computed using the 1-to-1 with lambda parameter method and in this case the <specs_method> element 
will contain one mandatory child elements and one optional element:
a21) <lambda> : it gives the lambda parameter of this method;
a22) <description> : an optional tag that can provide a textual description;

a3) name = "Pairs"
Means that the multiplicy probability was computed using the pairs method and in this case the <specs_method> element 
will contain one mandatory child elements and one optional element:
a31) <aprioriDupProb> : it gives the apriori probability for the mobile device to be in an 2-to-1 correspondence with its owner;
a32) <description> : an optional tag that can provide a textual description;

a4) name = "Trajectory"
Means that the multiplicy probability was computed using the trajectory method and in this case the <specs_method> element 
will contain one mandatory child elements and one optional element:
a41) <aprioriDupProb> : it gives the apriori probability for the mobile device to be in an 2-to-1 correspondence with its owner;
a41) <gamma> : it gives the apriori probability for an individual to have one mobile device;
a43) <description> : an optional tag that can provide a textual description;
