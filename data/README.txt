The xml files should be validated againts the schema files.
Here is a link to an online XML Schema validation service:  https://www.softwarebytes.org/xmlvalidation/
The xsd version should be set to 1.1 and Enable XSD 1.1 CTA full XPath checking to Yes.
Alternatively, you can use the schema-check.jar file:
java -jar schema_check xsd_file_name xml_file_name

Needless to say, you must have java installed.
