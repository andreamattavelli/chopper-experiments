#!/bin/bash

klee \
    --stats-write-interval=1000 \
    --istats-write-interval=1000 \
    --simplify-sym-indices \
    --max-memory=4095 \
    --max-sym-array-size=4096 \
    --disable-inlining \
    --use-cex-cache \
    --libc=uclibc \
    --allow-external-sym-calls \
    --only-output-states-covering-new \
    --watchdog \
    --switch-type=internal \
    --environ=/tmp/test.env \
    --run-in=/tmp/sandbox \
    --max-instruction-time=100. \
    --max-solver-time=30. \
    --max-time=3600. \
    --posix-runtime \
    --search=nurs:covnew \
    --recovery-search=dfs \
    -skip-functions=parse_args,yy_get_next_buffer,yyrestart \
    --inline=memcpy \
    bc/bc.bc A --sym-files 1 64 --sym-stdin 8 --sym-stdout

klee \
    --stats-write-interval=1000 \
    --istats-write-interval=1000 \
    --simplify-sym-indices \
    --max-memory=4095 \
    --max-sym-array-size=4096 \
    --disable-inlining \
    --use-cex-cache \
    --libc=uclibc \
    --allow-external-sym-calls \
    --only-output-states-covering-new \
    --watchdog \
    --switch-type=internal \
    --environ=/tmp/test.env \
    --run-in=/tmp/sandbox \
    --max-instruction-time=100. \
    --max-solver-time=30. \
    --max-time=3600. \
    --posix-runtime \
    --search=nurs:covnew \
    bc/bc.bc A --sym-files 1 64 --sym-stdin 8 --sym-stdout

