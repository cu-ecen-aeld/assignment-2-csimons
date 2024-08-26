#!/usr/bin/env bash

if [ "$#" != 2 ]
then
    >&2 echo "usage: $(basename $0) TARGET_FILE STRING_TO_WRITE"
    exit 1
fi

writefile=$1
writestr=$2

if [ ! -f "$writefile" ]
then
    mkdir -p "$writefile"
    rmdir "$writefile"
fi

echo "$writestr" > "$writefile"
