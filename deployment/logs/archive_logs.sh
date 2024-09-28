#!/bin/bash

LOG_DIR="/var/log/nginx" # Change this to your specific log directory
ARCHIVE_DIR="/var/log/nginx/archive"
DAYS=30

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Move logs older than 30 days to the archive directory
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec mv {} $ARCHIVE_DIR \;

echo "Archived logs older than $DAYS days."
