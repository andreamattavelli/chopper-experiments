#!/bin/bash

ulimit -s unlimited

klee \
    --simplify-sym-indices \
    --max-time=3600 \
    --max-memory=4096 \
    --allow-external-sym-calls \
    --only-output-states-covering-new \
    --libc=uclibc \
    --environ=/tmp/test.env \
    --run-in=/tmp/sandbox \
    --posix-runtime \
    --search=nurs:covnew \
    build/bc/bc.bc --sym-args 0 8 16 --sym-files 1 64 --sym-stdin 8 --sym-stdout

klee \
    --simplify-sym-indices \
    --max-time=3600 \
    --max-memory=4096 \
    --allow-external-sym-calls \
    --only-output-states-covering-new \
    --libc=uclibc \
    --environ=/tmp/test.env \
    --run-in=/tmp/sandbox \
    --posix-runtime \
    --search=nurs:covnew \
    --split-search \
    --skip-functions=parse_args,yy_get_next_buffer,yyrestart \
    --inline=memcpy \
    build/bc/bc.bc --sym-args 0 8 16 --sym-files 1 64 --sym-stdin 64 --sym-stdout

