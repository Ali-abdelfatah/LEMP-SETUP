#!/bin/bash

LOG_FILE="/var/log/nginx/error.log" # Change this to your specific log file
KEYWORDS=("error" "critical" "failed")

for keyword in "${KEYWORDS[@]}"; do
    echo "Checking for '$keyword' in $LOG_FILE:"
    grep -i "$keyword" $LOG_FILE
done
