#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Usage: <ktest_tool> <klee_out_dir> <input_size> <coverage_out_dir>"
    exit 1
fi

KTEST_TOOL=$1
KLEE_OUT_DIR=$2
INPUT_SIZE=$3
OUT_DIR=$4

for f in ./${KLEE_OUT_DIR}/*.ktest; do
    ${KTEST_TOOL} -d "$f.data" $f
    ./test ${INPUT_SIZE} "$f.data"
done

zcov scan out.zcov .
zcov genhtml out.zcov $OUT_DIR
rm out.zcov
