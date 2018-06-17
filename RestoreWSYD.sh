#!/bin/bash
# Restore Web Server + cloud disk.yandex.com

# Mount Cloud disk.yandex.com
mount -t davfs https://webdav.yandex.ru /mnt/yandex.disk/
# Enter login & pass cloud disk.yandex.com

# Copying backup to our server
cp /mnt/yandex.disk/backup/backup* /home/backup/

# Extract sites & server & databases
tar -xvf /home/backup/backup* -C /
tar -xzvf /home/backup/www.tgz -C /
tar -xzvf /home/backup/etc.tgz -C /
gunzip /home/backup/mysql.sql.gz

# Restore all databases
mysql -u root -p < /home/backup/mysql.sql;

# Cleanup work directory
rm -rf /home/backup/*

# Umount Cloud
umount /mnt/yandex.disk/

# Restart mysqld & apache2
/etc/init.d/mysql restart
/etc/init.d/apache2 restart

echo "Web.Server recuperated"
