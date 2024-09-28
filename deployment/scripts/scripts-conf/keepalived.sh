#!/bin/bash

# Script to manage Keepalived operations

# Function to start Keepalived
start_keepalived() {
    echo "Starting Keepalived..."
    sudo systemctl start keepalived
    echo "Keepalived started."
}

# Function to stop Keepalived
stop_keepalived() {
    echo "Stopping Keepalived..."
    sudo systemctl stop keepalived
    echo "Keepalived stopped."
}

# Function to restart Keepalived
restart_keepalived() {
    echo "Restarting Keepalived..."
    sudo systemctl restart keepalived
    echo "Keepalived restarted."
}

# Function to show Keepalived status
status_keepalived() {
    sudo systemctl status keepalived
}

# Main menu
echo "Keepalived Management Script"
echo "1. Start Keepalived"
echo "2. Stop Keepalived"
echo "3. Restart Keepalived"
echo "4. Show Keepalived Status"
echo "5. Exit"

read -rp "Select an option [1-5]: " option

case $option in
    1) start_keepalived ;;
    2) stop_keepalived ;;
    3) restart_keepalived ;;
    4) status_keepalived ;;
    5) exit 0 ;;
    *) echo "Invalid option." ;;
esac
