#!/bin/bash

# Create log directory if it doesn't exist
sudo mkdir -p /var/log/nginx/wordpress
sudo touch /var/log/nginx/wordpress/access.log
sudo touch /var/log/nginx/wordpress/error.log

# Set permissions
sudo chown -R nginx:nginx /var/log/nginx/wordpress
