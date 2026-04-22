# SHACL validation with N3 Logic

This is a project that aims to create a translation of SHACL into N3 Logic by reasoning on SHACL documents.

The idea is that you can input a SHACL document into this and get a set of N3 rules that, when applied via a reasoner on a data graph, will output a SHACL validation report.

The EYE Reasoner required to use this.
LINK: https://github.com/eyereasoner/eye

HOW TO USE:
You should either use the shell script "transl.sh" in the repository and call it with your SHACL document as the (first) argument. <br/>
Example:
```./transl.sh MySHACLdocument.n3```

And then call the provided shell script "applyClean.sh" for applying a translated SHACL document to a data graph cleanly via EYE. <br/>
The purpose of "applyClean.sh" is to unclutter the output to get just the SHACL validationreport as you would from a SHACL validator. <br/>
It takes a translated SHACL document (translated.n3) as its first argument and applies it to the datagraph that is given as a second argument. <br/>
This was tested on large the [SHACL testsuite](https://github.com/w3c/data-shapes/tree/gh-pages/data-shapes-test-suite/tests) . <br/>
EXAMPLE:
```./applyClean.sh translated.n3 MyDataGraph.n3```

Or you can use the shell script "run.sh" with the SHACL Document file as the first argument and the data graph file as the second argument. <br/>
This will simply run transl and applyClean back to back in one command. <br/>
EXAMPLE:
```./run.sh MySHACLdocument.n3 MyDataGraph.n3```

IMPORTANT NOTES: <br/>
-This may not function properly if you do not seperate your data graph from your shacl graph!! <br/>
-In case anyone looks at the code itself: change your tab size to 4 for readability <br/>
-some functionality is still WIP and may currently not work correctly or at all. <br/>