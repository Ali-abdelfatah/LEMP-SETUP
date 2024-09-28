#!/bin/bash

# Rotate Nginx logs
sudo logrotate -f /etc/logrotate.d/nginx

# Rotate PHP-FPM logs
sudo logrotate -f /etc/logrotate.d/php-fpm

echo "Log rotation completed successfully!"
