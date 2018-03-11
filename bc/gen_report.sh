#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: <report_dir>"
    exit 1
fi

REPORT_DIR=$1

rm -rf out.info
lcov --rc lcov_branch_coverage=1 -c -d ./bc-1.06/build -o out.info
genhtml --branch-coverage --ignore-errors=source out.info -o ${REPORT_DIR}
#rm -rf out.zcov
#zcov scan out.zcov .
#zcov genhtml out.zcov ${REPORT_DIR}
