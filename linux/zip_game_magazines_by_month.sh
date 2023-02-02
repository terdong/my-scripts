#!/bin/bash


echo "parameters count: $#"
echo "all parameters: $@"

for path in $@; do
    if [ -d $path ]; then
        #echo $path
        for child in "$path"/**/*; do
            if [ -d $child ]; then
                echo $child
                #Bandizip bc $child
                zip_name=${child}.zip
                zip -r -j $zip_name $child
                if [ -f $zip_name ]; then
                    rm -rf $child
                fi
            fi
        done
    fi
done




