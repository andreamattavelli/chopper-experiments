#!/bin/bash

time klee \
    -exit-on-error-type=Ptr \
    -libc=uclibc --posix-runtime \
    -search=random-state \
    -skip-functions=_asn1_set_value:872,_asn1_append_value,asn1_delete_structure \
    -inline=memcpy,memset \
    test.bc 30 1>out.log
