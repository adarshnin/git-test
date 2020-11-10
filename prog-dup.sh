#!/bin/bash

read -p "Enter the source path: "  spath
read -p "Enter the target path: "  tpath

#List all files and folders and show only files using grep -v
files=$(ls -p $spath | grep -v /)

#Split into variables separated by newline
readarray -t y <<<"$files"

for i in "${y[@]}"
do
    for j in "${y[@]}"
    do
        #If Not the same file
        if [ $i != $j ]
        then
            #If duplicate found
            if cmp --silent $i $j
            then
            #Move one of the files to destination
            mv $j $tpath
            fi
        fi
    done
done