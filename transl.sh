#!/bin/bash
#
# translating a SHACL file into N3 rules
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

eye $1 --pass --nope --quiet --no-qvars > grounded.n3
#eye $SCRIPT_DIR/proc/prepro.n3 grounded.n3 --pass --nope --quiet --no-qvars > processed.n3

#cat grounded.n3
eye $SCRIPT_DIR/proc/targeting.n3 $SCRIPT_DIR/core/CoreConstraintsNode.n3 $SCRIPT_DIR/core/CoreConstraintsProp.n3 $SCRIPT_DIR/core/NotConstraint.n3 grounded.n3 --pass-only-new --nope --quiet > translated.n3
cat translated.n3
#eye translated.n3 data.n3 --pass-only-new --nope --quiet