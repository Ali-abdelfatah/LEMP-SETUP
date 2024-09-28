#!/bin/bash

# Script to manage MariaDB operations

# Function to backup MariaDB database
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

# Function to show MariaDB status
status_mariadb() {
    sudo systemctl status mariadb
}

# Function to restart MariaDB
restart_mariadb() {
    echo "Restarting MariaDB..."
    sudo systemctl restart mariadb
    echo "MariaDB restarted successfully."
}

# Main menu
echo "MariaDB Management Script"
echo "1. Backup Database"
echo "2. Show MariaDB Status"
echo "3. Restart MariaDB"
echo "4. Exit"

read -rp "Select an option [1-4]: " option

case $option in
    1) backup_db ;;
    2) status_mariadb ;;
    3) restart_mariadb ;;
    4) exit 0 ;;
    *) echo "Invalid option." ;;
esac
