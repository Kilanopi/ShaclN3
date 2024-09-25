# SHACL validation with N3 Logic

This is a project that aims to create a translation of SHACL into N3 Logic by reasoning on SHACL documents.

The idea is that you can input a SHACL document into this and get a set of N3 rules that, when applied via a reasoner on a data graph, will output a SHACL validation report.

The EYE Reasoner required to use this.
LINK: https://github.com/eyereasoner/eye

HOW TO USE:
You can use the shell script in the repository and call it with your SHACL document as (first) argument.
Example:
```./transl.sh MySHACLdocument.n3```

IMPORTANT NOTES:

-I will make the output more readable asap
-In case anyone looks at the code itself: change your tab size to 4 for readability
-some functionality is still WIP and may currently not work correctly or at all, this includes but is not limited to:
    -(self-)recursive Shapes
    -Shapes with multiple logical constraints
    -resultSeverity
    -minor scope violations for multiple constraints (e.g sh:languageIn demanding literals)
    -all cardinality constraints (i.e all "qualified" shapes)
    -interaction with most propertypath types (e.g alternative path)