#!/bin/bash

# Define variables
PROJECT_DIR="/var/www/wordpress"  # Your WordPress project directory
BACKUP_DIR="/path/to/safe/location"  # Replace this with your actual backup directory
DATE=$(date +"%Y%m%d_%H%M%S")
PROJECT_BACKUP="lemp-project-backup_$DATE.tar.gz"
DB_BACKUP="all_databases_$DATE.sql"
COMPLETE_BACKUP="complete_backup_$DATE.tar.gz"

# Step 1: Backup Project Directory
cd $PROJECT_DIR
tar -czvf $PROJECT_BACKUP .

# Step 2: Backup Databases
mkdir -p backups/databases
mysqldump -u root -p --all-databases > backups/databases/$DB_BACKUP

# Step 3: Combine Project and Database Backup
tar -czvf $COMPLETE_BACKUP $PROJECT_BACKUP backups/databases

# Step 4: Move Backup to a Safe Location
mv $COMPLETE_BACKUP $BACKUP_DIR/
mv $PROJECT_BACKUP $BACKUP_DIR/
mv backups/databases/$DB_BACKUP $BACKUP_DIR/backups/databases/

# Cleanup
rm -rf backups/databases

echo "Backup completed successfully!"
