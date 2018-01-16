#!/bin/bash

KTEST_TOOL=/home/david/tau/slicing/klee/tools/ktest-tool/ktest-tool
OUT_DIR=$1
BINARY=$2
SIZE=$3

if [ $# -ne 3 ]; then
    echo "Usage: <klee_out_dir> <binary> <arg>"
    exit 1
fi

for f in ${OUT_DIR}/*.ktest; do
    ${KTEST_TOOL} -d "$f.data" $f
    ${BINARY} ${SIZE} "$f.data"
done
