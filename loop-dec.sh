#!/bin/bash

# Define file containing list of files to concatenate
filename="temp"

# Read file one line at a time
while read line; do
    # Check if file exists
    if [ -f "$line.enc" ]; then
        # Print filename to console
        echo "Reading file: $line.enc"
        # Concatenate file contents and print to console
        bash main.sh decrypt $line.enc
        # Wait for 1 second
        # sleep 1
    else
        # File does not exist
        echo "File not found: $line.enc"
    fi
done <"$filename"

if [ "$?" == "0" ]
then
rm temp
else
echo "error while dec"
fi