#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: <ktest_tool> <klee_out_dir> <input_size>"
    exit 1
fi

KTEST_TOOL=$1
KLEE_OUT_DIR=$2
INPUT_SIZE=$3

for f in ./${KLEE_OUT_DIR}/*.ktest; do
    ${KTEST_TOOL} -d "$f.data" $f
    ./test ${INPUT_SIZE} "$f.data"
done
