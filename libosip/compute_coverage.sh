#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: <klee_out_dir>"
    exit 1
fi

KLEE_OUT_DIR=$1
BINARY=./test-driver-gcov
INPUT_SIZE=10

for f in ./${KLEE_OUT_DIR}/*.ktest; do
    ktest-tool -d "$f.data" $f
    ${BINARY} ${INPUT_SIZE} "$f.data"
done
