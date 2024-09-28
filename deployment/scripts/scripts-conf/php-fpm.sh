#!/bin/bash

# Script to manage PHP-FPM operations

# Function to configure PHP-FPM
configure_php_fpm() {
    local fpm_conf="/etc/php-fpm.d/www.conf"  # Path to PHP-FPM configuration
    local template="/path/to/www.conf.j2"     # Path to your Jinja2 template

    echo "Copying PHP-FPM configuration..."
    if sudo cp "$template" "$fpm_conf"; then
        echo "PHP-FPM configuration copied successfully."
    else
        echo "Failed to copy PHP-FPM configuration." >&2
        return 1
    fi

    echo "Restarting PHP-FPM..."
    sudo systemctl restart php-fpm
    echo "PHP-FPM restarted successfully."
}

# Function to reload PHP-FPM
reload_php_fpm() {
    echo "Reloading PHP-FPM..."
    sudo systemctl reload php-fpm
    echo "PHP-FPM reloaded successfully."
}

# Function to show PHP-FPM status
status_php_fpm() {
    sudo systemctl status php-fpm
}

# Function to cleanup old logs
cleanup_logs() {
    local log_dir="/var/log/php-fpm"
    local days_to_keep=14

    echo "Cleaning up logs older than $days_to_keep days in $log_dir..."
    find "$log_dir" -type f -name "*.log" -mtime +$days_to_keep -exec rm -f {} \;
    echo "Old logs cleaned up."
}

# Main menu
echo "PHP-FPM Management Script"
echo "1. Configure PHP-FPM"
echo "2. Reload PHP-FPM"
echo "3. Show PHP-FPM Status"
echo "4. Cleanup Logs"
echo "5. Exit"

read -rp "Select an option [1-5]: " option

case $option in
    1) configure_php_fpm ;;
    2) reload_php_fpm ;;
    3) status_php_fpm ;;
    4) cleanup_logs ;;
    5) exit 0 ;;
    *) echo "Invalid option." ;;
esac
