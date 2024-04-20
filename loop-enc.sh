#!/bin/bash

# Define file containing list of files to concatenate
filename="temp"

# Read file one line at a time
while read line; do
    # Check if file exists
    if [ -f "$line" ]; then
        # Print filename to console
        echo "Reading file: $line"
        # Concatenate file contents and print to console
        bash main.sh encrypt $line
        # Wait for 1 second
        # sleep 1
    else
        # File does not exist
        echo "File not found: $line"
    fi
done <"$filename"