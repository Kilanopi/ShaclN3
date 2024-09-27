#!/bin/bash
#
# applying a translated SHACL N3 file cleanly, without the clutter (just the Report)
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ $1 ]] && [[ $2 ]] && [ -f $1 ] && [ -f $2 ]; then
    echo "Working with $1 and $2"
    echo "--------------------------------------------------------"
    eye $1 $2 $SCRIPT_DIR/proc/applyclean.n3 --pass-only-new --nope --quiet > output.n3
    echo "output of $1 on $2 created under output.n3:"
    echo "--------------------------------------------------------"
    cat output.n3
    echo "--------------------------------------------------------"
    echo "creating clean SHACL report of the output:"
    echo "..."
    eye $SCRIPT_DIR/proc/postproc.n3 output.n3 --query $SCRIPT_DIR/proc/postquery.n3 --nope --quiet >report.n3
    echo "clean SHACL report created under report.n3:"
    echo "--------------------------------------------------------"
    cat report.n3
    echo "--------------------------------------------------------"
else
    echo "pass a translated SHACL document (translated.n3) as the first argument and a data graph as second argument"
fi