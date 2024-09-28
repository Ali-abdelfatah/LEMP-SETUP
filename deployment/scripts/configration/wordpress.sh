#!/bin/bash

# Script to manage WordPress operations

# Function to backup WordPress database
backup_db() {
    local db_name="wordpress_db"  # Adjust your database name
    local db_user="db_user"       # Adjust your database user
    local db_pass="db_password"   # Adjust your database password
    local backup_dir="/path/to/backup"  # Specify your backup directory
    local timestamp=$(date +"%F")

    echo "Creating backup directory if not exists..."
    mkdir -p "$backup_dir"

    echo "Backing up the database..."
    if mysqldump -u "$db_user" -p"$db_pass" "$db_name" > "$backup_dir/$db_name-$timestamp.sql"; then
        echo "Database backup successful: $backup_dir/$db_name-$timestamp.sql"
    else
        echo "Database backup failed." >&2
        return 1
    fi
}

# Function to set permissions for WordPress files
set_permissions() {
    local wp_dir="/var/www/wordpress"  # Adjust your WordPress directory
    local www_group="nginx"            # Adjust your web server group if needed

    echo "Setting ownership..."
    sudo chown -R $USER:$www_group "$wp_dir"

    echo "Setting directory permissions..."
    find "$wp_dir" -type d -exec chmod 755 {} \;

    echo "Setting file permissions..."
    find "$wp_dir" -type f -exec chmod 644 {} \;

    echo "Permissions set for WordPress directory."
}

# Main menu
echo "WordPress Management Script"
echo "1. Backup Database"
echo "2. Set File Permissions"
echo "3. Exit"

read -rp "Select an option [1-3]: " option

case $option in
    1) backup_db ;;
    2) set_permissions ;;
    3) exit 0 ;;
    *) echo "Invalid option." ;;
esac
