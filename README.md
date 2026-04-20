# SHACL validation with N3 Logic

This is a project that aims to create a translation of SHACL into N3 Logic by reasoning on SHACL documents.

The idea is that you can input a SHACL document into this and get a set of N3 rules that, when applied via a reasoner on a data graph, will output a SHACL validation report.

The EYE Reasoner required to use this.
LINK: https://github.com/eyereasoner/eye

HOW TO USE:
You should use the shell script transl.sh in the repository and call it with your SHACL document as the (first) argument. <br/>
Example:
```./transl.sh MySHACLdocument.n3```

The provided shell script for applying a translated SHACL document do a data graph cleanly via EYE is called applyClean.sh . <br/>
Its purpose is to unclutter the output to get just the SHACL validationreport as you would from a SHACL validator. <br/>
It takes a translated SHACL document (translated.n3) as its first argument and applies it to the datagraph that is given as a second argument. <br/>
This was tested on large the [SHACL testsuite](https://github.com/w3c/data-shapes/tree/gh-pages/data-shapes-test-suite/tests) . <br/>
EXAMPLE:
```./applyClean.sh translated.n3 MyDataGraph.n3```

IMPORTANT NOTES: <br/>
-This may not function properly if you do not seperate your data graph from your shacl graph!! <br/>
-In case anyone looks at the code itself: change your tab size to 4 for readability <br/>
-some functionality is still WIP and may currently not work correctly or at all. to see what components of shacl are fully operational, see [this table](https://docs.google.com/spreadsheets/d/1jUb_fHszuSZQYpAVdpspBHCITahNhvylPwVjMYi_dys) from the test suite evaluation <br/>