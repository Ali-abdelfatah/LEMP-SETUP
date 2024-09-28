#!/bin/bash

# Script to manage Nginx configuration and operations

# Function to configure Nginx
configure_nginx() {
    local nginx_conf="/etc/nginx/conf.d/wordpress.conf"  # Path to your Nginx config
    local template="/path/to/wordpress.conf.j2"  # Path to your Jinja2 template

    echo "Copying Nginx configuration..."
    if sudo cp "$template" "$nginx_conf"; then
        echo "Nginx configuration copied successfully."
    else
        echo "Failed to copy Nginx configuration." >&2
        return 1
    fi

    echo "Testing Nginx configuration..."
    if sudo nginx -t; then
        echo "Nginx configuration test successful."
        echo "Restarting Nginx..."
        sudo systemctl restart nginx
        echo "Nginx restarted successfully."
    else
        echo "Nginx configuration test failed." >&2
        return 1
    fi
}

# Function to reload Nginx
reload_nginx() {
    echo "Reloading Nginx..."
    sudo systemctl reload nginx
    echo "Nginx reloaded successfully."
}

# Function to show Nginx status
status_nginx() {
    sudo systemctl status nginx
}

# Function to cleanup old logs
cleanup_logs() {
    local log_dir="/var/log/nginx/wordpress"
    local days_to_keep=14

    echo "Cleaning up logs older than $days_to_keep days in $log_dir..."
    find "$log_dir" -type f -name "*.log" -mtime +$days_to_keep -exec rm -f {} \;
    echo "Old logs cleaned up."
}

# Main menu
echo "Nginx Management Script"
echo "1. Configure Nginx"
echo "2. Reload Nginx"
echo "3. Show Nginx Status"
echo "4. Cleanup Logs"
echo "5. Exit"

read -rp "Select an option [1-5]: " option

case $option in
    1) configure_nginx ;;
    2) reload_nginx ;;
    3) status_nginx ;;
    4) cleanup_logs ;;
    5) exit 0 ;;
    *) echo "Invalid option." ;;
esac
