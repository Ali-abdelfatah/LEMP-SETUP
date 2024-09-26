# High-Availability LEMP WordPress Setup

## Overview

This project provides a highly available WordPress setup using the LEMP (Linux, Nginx, MariaDB, PHP) stack. The deployment features load balancing across two Nginx servers, database replication, and a Keepalived configuration for high availability.

## Table of Contents

- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Deployment Steps](#deployment-steps)
- [Configuration Details](#configuration-details)
- [Logging](#logging)
- [Backup Strategy](#backup-strategy)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Project Structure

lemp-project1/ ├── ansible-work/ ├── deployment/ │ ├── logs/ │ ├── scripts/ ├── documentation/ ├── README.md └── backups/




## Technologies Used

- **Linux** (CentOS)
- **Nginx** - Web server and reverse proxy
- **MariaDB** - Database server with replication
- **PHP** - Server-side scripting language
- **Keepalived** - High availability solution
- **Ansible** - Automation and orchestration

## Deployment Steps

1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd lemp-project1



Run Deployment Scripts:

Execute the Nginx configuration script:
bash
Copy code
./deployment/scripts/nginx.sh
Set up WordPress:
bash
Copy code
./deployment/scripts/wordpress.sh


Configure Keepalived:

Ensure Keepalived is installed and configured on both Nginx servers.



Set Up Database Replication:

Configure MariaDB on the master and slave servers as per your setup instructions.





Configuration Details


Nginx Configuration


The Nginx configuration files are located in the deployment/scripts directory. Adjust the following settings as needed:

nginx.conf: Main Nginx configuration
wordpress.conf: Configuration for the WordPress site
Keepalived Configuration
The Keepalived configuration file should be set up to monitor the Nginx servers and provide failover capabilities.

Logging



The logging setup includes:

Log Rotation: Ensure logs are rotated to prevent excessive disk usage.
Scripts:
cleanup_logs.sh - A script to clean up old log files.
setup_logging.sh - A script to configure logging settings.
Backup Strategy
Backups are crucial for recovery. The backup strategy includes:

Database Backups: Regularly scheduled backups of the MariaDB database.


File Backups: Backups of the WordPress files and configuration.

Backup Scripts

Place your backup scripts in the deployment/scripts directory.

