#!/bin/bash

# Check if the input file containing aliases exists
if [ ! -f "$1" ]; then
    echo "Usage: $0 <alias_file>"
    exit 1
fi

# Append aliases from the input file to .bashrc
while read -r alias_line; do
    if [[ -n "$alias_line" && ! "$alias_line" =~ ^\s*# ]]; then
        echo "$alias_line" >> ~/.bashrc
    fi
done < "$1"

# Source the updated .bashrc to apply the changes
source ~/.bashrc