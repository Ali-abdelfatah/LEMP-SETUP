#!/bin/bash

# Script to clean up old logs

LOG_DIR="/var/log/nginx/wordpress"
DAYS_TO_KEEP=14

# Find and remove log files older than specified days
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_TO_KEEP -exec rm -f {} \;

echo "Old logs cleaned up in $LOG_DIR."
