# SHACL validation with N3 Logic

This is a project that aims to create a translation of SHACL into N3 Logic by reasoning on SHACL documents.

The idea is that you can input a SHACL document into this and get a set of N3 rules that, when applied via a reasoner on a data graph, will output a SHACL validation report.

The EYE Reasoner required to use this.
LINK: https://github.com/eyereasoner/eye

HOW TO USE:
You can use the shell script transl.sh in the repository and call it with your SHACL document as (first) argument. <br/>
Example:
```./transl.sh MySHACLdocument.n3```
<br/>
I also provided a shell script for applying a translated SHACL document do a data graph cleanly via EYE. <br/>
It takes a translated SHACL document (translated.n3) as its first argument and applies it to the datagraph it is given as a second argument. <br/>
This wasn't tested on large datasets. Its purpose is to unclutter the output to get just the SHACL validationreport as you would from a SHACL validator. <br/>
EXAMPLE:
```./applyClean.sh translated.n3 MyDataGraph.n3```

IMPORTANT NOTES:

-In case anyone looks at the code itself: change your tab size to 4 for readability <br/>
-some functionality is still WIP and may currently not work correctly or at all, this includes but is not limited to: <br/>
    -(self-)recursive Shapes <br/>
    -Shapes with multiple logical constraints <br/>
    -resultSeverity <br/>
    -minor scope violations for multiple constraints (e.g sh:languageIn demanding literals) <br/>
    -all cardinality constraints (i.e all "qualified" shapes) <br/>
    -interaction with most propertypath types (e.g alternative path) <br/>