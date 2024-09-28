# LEMP Stack Deployment Guide

## 1. Prerequisites
- CentOS installed on all servers
- SSH access to the servers
- Git installed to clone the project repository
- Nginx, MariaDB, and PHP pre-installed

## 2. Initial Server Setup
### Step 1: Update the system
```bash
sudo yum update -y


## 3. Install Required Packages

sudo yum install epel-release -y
sudo yum install nginx mariadb-server php-fpm -y


## 4. Configure Firewalls

sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

## 5. Nginx Setup
Step 1: Configure Nginx as a Reverse Proxy
bash
Copy code
# Edit /etc/nginx/nginx.conf to include reverse proxy settings
Step 2: Enable Nginx
bash

sudo systemctl enable nginx
sudo systemctl start nginx

## 6. Database Replication Setup
Step 1: Configure Master Database
bash

# Modify /etc/my.cnf on the master
[mysqld]
server-id=1
log_bin=/var/log/mysql/mysql-bin.log
Step 2: Configure Slave Database
bash

# Modify /etc/my.cnf on the slave
[mysqld]
server-id=2
replicate-do-db=wordpress_db
Step 3: Start Replication
bash


# Execute replication commands

## 5. Keepalived Setup
Step 1: Install Keepalived
bash
Copy code
sudo yum install keepalived -y
Step 2: Configure Virtual IPs for Failover
bash

# Edit /etc/keepalived/keepalived.conf to define VIP and failover settings
## 6. WordPress Installation
Step 1: Download and Install WordPress
bash
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvf latest.tar.gz -C /var/www/html

##Step 2: Configure WordPress to use Replicated Database
bash
# Modify wp-config.php to include the database replication setup

##7. Testing and Verification
Verify Nginx load balancing by stopping one Nginx server and checking failover.
Test database replication by creating a record in the master database and verifying it on the slave.
Ensure WordPress is fully functional.


