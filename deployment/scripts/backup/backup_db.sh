#!/bin/bash

# Script to back up the WordPress database

# Variables
DB_NAME="wordpress_db"  # Adjust your database name
DB_USER="db_user"       # Adjust your database user
DB_PASS="db_password"   # Adjust your database password
BACKUP_DIR="/path/to/backup"  # Specify your backup directory
TIMESTAMP=$(date +"%F")

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup the database
if mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql"; then
    echo "Database backup successful: $BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql"
else
    echo "Database backup failed." >&2
    exit 1
fi
