#!/bin/bash
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ $1 ]] && [[ $2 ]] && [ -f $1 ] && [ -f $2 ]; then
    $SCRIPT_DIR/transl.sh $1
    $SCRIPT_DIR/applyClean.sh $SCRIPT_DIR/translated.n3 $2
else
    echo "pass a SHACL document as the first argument and a data graph as second argument"
fi