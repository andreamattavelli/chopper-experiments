#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: <report_dir>"
    exit 1
fi

REPORT_DIR=$1

lcov --rc lcov_branch_coverage=1 -c -d . -o out.info
genhtml --branch-coverage out.info -o ${REPORT_DIR}
