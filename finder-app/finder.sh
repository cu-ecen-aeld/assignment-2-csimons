#!/usr/bin/env bash

if [ "$#" != 2 ]
then
    >&2 echo "usage: $(basename $0) FILES_DIR SEARCH_STRING"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]
then
    >&2 echo "error: $filesdir: not a directory"
    exit 1
fi

nfiles=$(find $filesdir -type f | wc -l | tr -d '[:blank:]')
nmatches=$(find $filesdir -type f | xargs grep $searchstr | wc -l | tr -d '[:blank:]')

echo "The number of files are $nfiles and the number of matching lines are $nmatches"
