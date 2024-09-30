# Troubleshooting Guide

## 1. Nginx Issues
### Problem: Nginx is not starting
- **Solution**: Check if the configuration is correct:
```bash
sudo nginx -t
If you see errors, fix them and restart Nginx.

##Problem: Load Balancing is not working
Solution: Ensure that Keepalived is running on both Nginx servers.
bash

sudo systemctl status keepalived

##2. Database Replication Issues
Problem: Slave is not replicating data
Solution: Check the replication status on the slave server:
bash

SHOW SLAVE STATUS\G;
Look for any errors in the output and resolve them by correcting the master_log_file and master_log_pos.

##Problem: Cannot connect to the database
Solution: Ensure that the database ports (default 3306) are open in the firewall:
bash
sudo firewall-cmd --add-port=3306/tcp --permanent
sudo firewall-cmd --reload


##3. Keepalived Failover Issues
Problem: Keepalived is not promoting the backup server
Solution: Check the Keepalived logs for any errors:
bash
Copy code
sudo tail -f /var/log/messages | grep keepalived
Ensure that both Nginx servers are correctly configured with a Virtual IP.


##4. WordPress Issues
Problem: WordPress is not connecting to the database
Solution: Check the wp-config.php file to verify the database credentials are correct and ensure the database server is reachable.
