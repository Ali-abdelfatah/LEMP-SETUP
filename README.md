<<<<<<< HEAD
# LEMP-SETUP
HA-LEMP SETUP 
=======
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

LEMP-Project/
├── ansible/
│   ├── inventory.ini            # Ansible inventory file
│   ├── playbook.yml             # Main Ansible playbook
│   ├── group_vars/
│   │   └── all.yml              # Variables for all hosts
│   ├── roles/
│   │   ├── nginx/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml     # Nginx installation and configuration
│   │   │   │   ├── handlers.yml  # Handlers for Nginx (e.g., restart)
│   │   │   └── templates/
│   │   │       ├── nginx.conf.j2        # Nginx configuration template
│   │   │       └── wordpress.conf.j2    # WordPress site configuration template
│   │   ├── mariadb/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml       # MariaDB installation and configuration
│   │   │   │   └── handlers.yml    # Handlers for MariaDB
│   │   └── templates/
│   │       └── my.cnf.j2          # MariaDB configuration template
│   │   ├── wordpress/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml       # WordPress installation and configuration
│   │   │   │   └── handlers.yml    # Handlers for WordPress
│   │   └── templates/
│   │       └── wp-config.php.j2    # WordPress config template
│   │   ├── keepalived/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml       # Keepalived installation and configuration
│   │   │   │   └── handlers.yml    # Handlers for Keepalived
│   │   └── templates/
│   │       └── keepalived.conf.j2  # Keepalived config template
│   └── templates/
│       └── inventory-template.ini  # Template for inventory file
├── deployment/
│   ├── scripts/
│   │   ├── deploy.sh               # Deployment script for the LEMP stack
│   │   ├── backup.sh               # Backup script for databases and files
│   │   └── restore.sh              # Restore script for databases and files
│   ├── logs/
│   │   ├── nginx/                  # Nginx logs
│   │   ├── mariadb/                # MariaDB logs
│   │   └── wordpress/              # WordPress logs
├── documentation/
│   ├── architecture.md             # Architecture overview of the LEMP stack
│   ├── deployment-guide.md         # Detailed deployment guide
│   └── troubleshooting.md          # Troubleshooting common issues
└── README.md                       # Project overview and setup instructions




## Technologies Used

Linux (CentOS): Operating system for the servers.
Nginx: Web server and reverse proxy.
MariaDB: Database server with replication.
PHP: Server-side scripting language.
Keepalived: Provides high availability and failover.
Ansible: Automation and configuration management.

## Deployment Steps

1. **Clone the Repository:**
   ```bash
   git clone <https://github.com/Ali-abdelfatah/LEMP-SETUP.git>
   



##Run Deployment Scripts:

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

>>>>>>> master
