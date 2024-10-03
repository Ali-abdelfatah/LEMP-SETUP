Resilient Web Application Infrastructure: High-Availability LEMP Stack with Load Balancing and ELK Stack, Managed by Ansible

## Overview

This project provides a highly available WordPress setup using the LEMP (Linux, Nginx, MariaDB, PHP) stack, along with an integrated ELK (Elasticsearch, Logstash, Kibana) stack for centralized logging. The deployment features load balancing across two Nginx servers, database replication, and a Keepalived configuration for high availability.

## Table of Contents

1- [Project Structure](#project-structure)
2- [Technologies Used](#technologies-used)
3- [Deployment Steps](#deployment-steps)
4- [Configuration Details](#configuration-details)
5- [Logging](#logging)
6- [Backup Strategy](#backup-strategy)
7- [Troubleshooting](#troubleshooting)
8- [License](#license)

## Project Structure



LEMP-Project/
├── ansible-lemp/
│   ├── inventory.ini            # Ansible inventory file for LEMP stack
│   ├── lemp-playbook.yml        # Main Ansible playbook for LEMP stack
│   ├── group_vars/
│   │   └── all.yml              # Variables for all hosts in LEMP stack
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
│   │   │   └── templates/
│   │   │       └── my.cnf.j2          # MariaDB configuration template
│   │   ├── wordpress/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml       # WordPress installation and configuration
│   │   │   │   └── handlers.yml    # Handlers for WordPress
│   │   │   └── templates/
│   │   │       └── wp-config.php.j2    # WordPress config template
│   │   ├── keepalived/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml       # Keepalived installation and configuration
│   │   │   │   └── handlers.yml    # Handlers for Keepalived
│   │   │   └── templates/
│   │   │       └── keepalived.conf.j2  # Keepalived config template
├── ansible-elk/
│   ├── elk-playbook.yml          # Main Ansible playbook for ELK stack
│   ├── inventory.ini             # Ansible inventory file for ELK stack
│   ├── group_vars/
│   │   └── all.yml               # Variables for all hosts in ELK stack
│   ├── roles/
│   │   ├── elk/
│   │   │   ├── tasks/
│   │   │   │   ├── main.yml       # ELK stack installation and configuration
│   │   │   │   ├── handlers.yml    # Handlers for ELK stack
│   │   │   └── templates/
│   │   │       ├── filebeat.yml.j2    # Filebeat config template
│   │   │       ├── elasticsearch.yml.j2 # Elasticsearch config template
│   │   │       ├── kibana.yml.j2      # Kibana config template
│   │   │       └── logstash.yml.j2     # Logstash config template
│   │   └── vars/
│   │       └── all.yml            # Variables for ELK stack
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
│   ├── architecture.md             # Architecture overview of the LEMP and ELK stacks
│   ├── deployment-guide.md         # Detailed deployment guide for LEMP and ELK
│   └── troubleshooting.md          # Troubleshooting common issues
└── README.md                       # Project overview and setup instructions











## Technologies Used

- **Linux (CentOS)**: Operating system for the servers.

- **Nginx**: Web server , reverse proxy and load balancer.

- **MariaDB**: Database server with replication.

- **PHP**: Server-side scripting language.

- **Keepalived**: Provides high availability and failover.

- **Ansible**: Automation and configuration management.

- **ELK Stack**: Centralized logging solution, including:
  - **Elasticsearch**: Data storage and search engine.
  - **Logstash**: Log processing and forwarding.
  - **Kibana**: Data visualization and management interface.
- **Filebeat**: Lightweight shipper for forwarding and centralizing log data.

## Deployment Steps

1. **Clone the Repository:**
   ```bash
   git clone <https://github.com/Ali-abdelfatah/LEMP-SETUP.git>





##Configuration Details

--Nginx Configuration

 -The Nginx configuration files are located in the deployment/scripts directory. Adjust the following settings as needed:

##nginx.conf: Main Nginx configuration

##wordpress.conf: Configuration for the WordPress site

##Keepalived Configuration

##The Keepalived configuration file should be set up to monitor the Nginx servers and provide failover capabilities.

--ELK Stack Configuration
  
 The ELK stack, along with Filebeat, is configured to collect logs from Nginx, PHP, MariaDB, and other relevant sources. The Filebeat configuration is set to send logs to Logstash for   
processing and storage in Elasticsearch.

--Logging
 The logging setup includes:

 Log Rotation: Ensure logs are rotated to prevent excessive disk usage.
 --Scripts:
 cleanup_logs.sh: A script to clean up old log files.
  setup_logging.sh: A script to configure logging settings.
  Backup Strategy
  Backups are crucial for recovery. The backup strategy includes:

--Database Backups: Regularly scheduled backups of the MariaDB database.
-File Backups: Backups of the WordPress files and configuration.
##Backup Scripts
Place your backup scripts in the deployment/scripts directory.

--Troubleshooting
For common issues, refer to the troubleshooting.md document in the documentation directory.


