#!/bin/bash
# Backup Web Server on Ubuntu + cloud disk.yandex.com (need be registered)

# Variable "today"
nowadays=$(date +"%Y-%m-%d")

# Mount Cloud disk.yandex.com
mount -t davfs https://webdav.yandex.ru /mnt/yandex.disk/
# Enter login & pass cloud disk.yandex.com

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

#  Moving your Archive Data to the Cloud
mv /home/backup/backup_$nowadays.tar /mnt/yandex.disk/backup

# Cleanup work directory
#rm -rf /home/backup/*

# Umount Cloud
umount /mnt/yandex.disk/

echo "Backup file created"
