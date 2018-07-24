#!/bin/bash

# Backup Web Server
# Tested Ubuntu+LAMP

# Variable "today"
nowadays=$(date +"%Y-%m-%d")

# Creating work directory
mkdir /home/backup/

# Cleanup old backups
rm -rf /home/backup/*

# Archiving sites & server
tar cfvzp /home/backup/www.tgz /var/www/
tar cfvzp /home/backup/etc.tgz /etc/

# Archiving all databases
mysqldump -u root -p --all_databases | gzip > /home/backup/mysql.sql.gz

# Archiving sites & server & databases
tar cfvP /home/backup/backup_$nowadays.tar /home/backup/*

# Cleanup work directory
rm -rf /home/backup/*.tgz
rm -rf /home/backup/*.gz

# LAst message
echo "Backup file created, see /home/backup/"
