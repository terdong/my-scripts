#!/bin/bash

echo "parameters count: $#"
#echo "first parameter: $1"
echo "all parameters: $@"
echo "######################################################################"

ROOT=$1
SOURCE_EXTENSION=$2
TARGET_EXTENSION=$3

if [[ $# != 3 ]]; then
    echo "not enough parameters"
    exit 0
fi

cd $ROOT
ARR=()
i=0
if [ -d . ]; then
    for SOURCE in ./*.${SOURCE_EXTENSION}; do
        ARR+=("$SOURCE")
        echo $SOURCE
    done
    for TARGET in ./*.${TARGET_EXTENSION}; do
       TEMP=${TARGET##*/}
       TEMP=`echo "${TEMP%.*}" | sed 's/ /_/g'`
       echo "${TEMP}"
       mv "$TARGET" "${TEMP}.${TARGET_EXTENSION}"
       mv "${ARR[i]}" "${TEMP}.${SOURCE_EXTENSION}"
       i=`expr $i + 1`
    done
fi

