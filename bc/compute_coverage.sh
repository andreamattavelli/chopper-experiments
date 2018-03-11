#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: <klee_out_dir>"
    exit 1
fi

KLEE_OUT_DIR=$1

for f in ./${KLEE_OUT_DIR}/*.ktest; do
    klee-replay ./bc-1.06/build/bc/bc $f
done
