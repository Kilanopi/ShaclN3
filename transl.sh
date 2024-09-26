#!/bin/bash
#
# translating a SHACL file into N3 rules
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ $1 ]] && [ -f $1 ]; then
    echo "Working with $1"
    echo "--------------------------------------------------------"
    eye $1 --pass --nope --quiet --no-qvars > grounded.n3
    echo "grounded version of $1 created under grounded.n3:"
    echo "--------------------------------------------------------"
    cat grounded.n3
    echo "--------------------------------------------------------"
    echo "creating translation of $1 into N3"
    echo "..."
    eye $SCRIPT_DIR/proc/targeting.n3 $SCRIPT_DIR/core/CoreConstraintsNode.n3 $SCRIPT_DIR/core/CoreConstraintsProp.n3 $SCRIPT_DIR/core/NotConstraint.n3 grounded.n3 --pass-only-new --nope --quiet > translated.n3
    echo "translated version of $1 created under translated.n3:"
    echo "--------------------------------------------------------"
    cat translated.n3
    echo "--------------------------------------------------------"
else
    echo "pass a SHACL document as the first argument"
fi