#!/bin/bash
# Restore Web Server

# Copying backup to our server
# Start on your computer
# scp -p 22 /home/backup/backup_* user@your_web_ip:/home/backup/

# Extract sites & server & databases
tar -xvf /home/backup/backup* -C /
tar -xzvf /home/backup/www.tgz -C /
tar -xzvf /home/backup/etc.tgz -C /
gunzip /home/backup/mysql.sql.gz

# Restore all databases
mysql -u root -p < /home/backup/mysql.sql;

# Cleanup work directory
rm -rf /home/backup/*

# Restart mysqld & apache2
/etc/init.d/mysql restart
/etc/init.d/apache2 restart

echo "Web.Server restored"
