#!/bin/bash

# Parameters: 1- directory, 2- label
# Returns on STDOUT: label,coverage,dfs,random
print_single_result()
{
    paste -d ',' \
    <( echo "$2" ) \
    <( grep Elapsed $1*/*-coverage$3/info | cut -d ' ' -f2 ) \
    <( grep Elapsed $1*/*-dfs$3/info | cut -d ' ' -f2 ) \
    <( grep Elapsed $1*/*-random$3/info | cut -d ' ' -f2 )
}

# Parameters: 1- directory, 2- label
# Returns on STDOUT for each subdirectory 'directory-[10,50]' found: label,coverage,dfs,random
print_multiple_result()
{
    paste -d ',' \
	  <( for num in `seq 10 10 50`; do echo "$2 $num"; done ) \
	  <( grep Elapsed $1-*/*-coverage$3/info | cut -d ' ' -f2 ) \
	  <( grep Elapsed $1-*/*-dfs$3/info | cut -d ' ' -f2 ) \
	  <( grep Elapsed $1-*/*-random$3/info | cut -d ' ' -f2 )
}

print_header()
{
    echo "EXPERIMENT,COVERAGE,DFS,RANDOM"
}

print_results()
{
    if [ -n "$2" ]
    then
        SUBBENCH="-$2"
    else
        SUBBENCH=""
    fi
    echo "===== Running on '$1$SUBBENCH' =====" >&2
    cd $1
    print_header
    print_single_result   "klee" "KLEE" $SUBBENCH
    print_single_result   "cse-no-searcher" "STANDARD" $SUBBENCH
    print_multiple_result "cse-split-searcher" "SPLIT-SEARCH" $SUBBENCH
    print_multiple_result "cse-recovery-searcher-rp" "RECOVERY-SEARCH-RP" $SUBBENCH
    print_multiple_result "cse-recovery-searcher-dfs" "RECOVERY-SEARCH-DFS" $SUBBENCH
    cd ..
}


## MAIN
print_results CVE-2012-1569 > CVE-2012-1569.csv
print_results CVE-2014-3467 1 > CVE-2014-3467_1.csv
print_results CVE-2014-3467 2 > CVE-2014-3467_2.csv
print_results CVE-2014-3467 3 > CVE-2014-3467_3.csv
print_results CVE-2015-2806 > CVE-2015-2806.csv
print_results CVE-2015-3622 > CVE-2015-3622.csv
