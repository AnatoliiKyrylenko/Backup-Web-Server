# Backup-Web-Server
<p align="center">Backup Web Server | BASH SCRIPT</p>
<p align="center">
  <img src ="https://github.com/AnatoliiKyrylenko/Backup-Web-Server/blob/master/imageb1.png"/>
      <img src ="https://github.com/AnatoliiKyrylenko/Backup-Web-Server/blob/master/imageb2.png"/>
</p>


Script to backup your Web Server

EN info
+ BackupWS.sh - script backup to local computer
+ RestoreWS.sh - script restore with local computer
+ BackupWSYD.sh - script backup to disk.yandex.com
+ RestoreWSYD.sh - script restore with disk.yandex.com

RU info
+ BackupWS.sh - скрипт для бэкапа сервера на домашний компьютер
+ RestoreWS.sh - скрипт для восстановления бэкапа сервера с домашнего компьютера
+ BackupWSYD.sh - скрипт для бэкапа сервера на облако yandex
+ RestoreWSYD.sh - скрипт для восстановления бэкапа сервера с облака yandex

Backup next
	/etc/
	/var/www/
	database (MySQL, Mariadb)

# Programming Languages:

    BASH

# System:

    Linux

# Tested  

    Ubuntu 16
    LAMP server

# RUN

\# bash ./BackupWS.sh (or any another script)

# Explanation EN
### BackupWS.sh
Running on server.
This script asks to authorize the yandex.disk, (need be registered).
Create directory /home/backup/, & archiving /etc, /var/www, Database (MyaQL or MariaDB).
Ask root password at DateBase for copy Database

Comand for copying backup to home PC
scp -p 22 user@your_web_ip:/home/backup/* /home/backup/
user - user name to server, your_web_ip - server ip

### RestoreWS.sh
Comand for copying backup to Web server
scp -p 22 /home/backup/backup_ver user@your_web_ip:/home/backup/
user - user name to server, your_web_ip - server ip
Copying backup (need be only one file backup) to your server.

Script need be running on server.
Unpacks directories /var/www & /etc.
Ask root passwor at DateBase for restoring.
Restarting apache2 и mysql.

### Preparing (need for use yandex.disk)
---------------------------------------------------
1. Installing utility davfs2 for mounting disk.yandex.com
```
apt-get install davfs2
```
2. Creating mount point: mnt/yandex.disk
```
mkdir /mnt/yandex.disk
```
Test
---------------------------------------------------
1. Mount disk:
```
mount -t davfs https://webdav.yandex.ru /mnt/yandex.disk/
```
2. Just checking if everything's ok:
```
df -h /mnt/yandex.disk/
```
We get something similar:
Filesystem                Size  Used Avail Use% Mounted on
https://webdav.yandex.ru   50G  1000M   49G   2% /mnt/yandex.disk

3 Unmount disk
```
sudo umount /mnt/yandex.disk/
```
### BackupWSYD.sh
Running on server.
This script asks to authorize the yandex.disk, (need be registered).
Create directory /home/backup/, & archiving /etc, /var/www, Database (MyaQL or MariaDB).
Ask root passwor at DateBase for copy Database
Moveing backup to yandex.disk cloud.
Unmount yandex cloud.

### RestoreWSYD.sh
Running on server.
Script asks to authorize the yandex.disk. 
Moveing backup (with yundex, need be only one file backup) to your server.
Unpacks directories /var/www & /etc.
Ask root passwor at DateBase for restoring.
Unmount yandex cloud.
Restarting apache2 и mysql.

# Explanation RU
### BackupWS.sh
Скрипт запускается на стороне сервера и собирает файлы веб сервера, файлы сайта и базы данных.
BackupWS.sh создаст файл бэкапа (вида backup_2018-06-16.tar) на вашем сервере по адресу /home/backup/ если каталога нет, созадаст его.
Если в каталоге были старые бекапы то удалит их.
Во время работы попросит ввести пароль root базы данных для её копирования.

Далее вы можите использовать либо сторонний софт такой как FileZilla, либо предложенную мной команду для копирования файла бэкапа к себе на устройство.

Команда для копирования бэкапа на домашний компьютер:
scp -p 22 user@your_web_ip:/home/backup/* /home/backup/

Где user - имя вашего пользователя на сервере, your_web_ip - ip адрес сервера, /home/buckup/ - каталог на домашней машине, предварительно убедитесь что он существует, или укажите другой.

### RestoreWS.sh
Как и вслучае создания бэкапа, вы можите использовать либо сторонний софт такой как FileZilla, либо предложенную мной команду для копирования файла бэкапа на Web сервер.

Команда для копирования бэкапа с домашнего компьютера на сервер:
scp -p 22 /home/backup/backup_ver user@your_web_ip:/home/backup/

Где backup_ver - название нужной версии бэкапа для восстановления, user - имя вашего пользователя на сервере, your_web_ip - ip адрес сервера, /home/buckup/ - каталог на домашней машине, предварительно убедитесь что он существует, или укажите другой.

Скрипт запускается на стороне сервера.
RestoreWS.sh восстановит файлы веб сервера, файлы сайта и базы данных с бекапа находящегося в /home/backup/
Убедитесь что по данному адресу находится только один нужный вам бэкап.
Во время работы попросит ввести пароль root базы данных для её копопирования.
В конечном итоге перезагружает apache2 и mysql.

### Подготовка (нужна для использования облака yandex)
---------------------------------------------------
1. Копирование файлов на disk.yandex.com происходит по протоколу WebDAV, посему следует установить утилиту davfs2
# apt-get install davfs2

2. Создадим точку монтирования, папку на нашем сервере, куда будем кидать бэкапы: mnt/yandex.disk
# mkdir /mnt/yandex.disk

Тест монтирования облака disk.yandex.com
---------------------------------------------------
1. Монтируем диск:
# mount -t davfs https://webdav.yandex.ru /mnt/yandex.disk/

2. Проверяем всё-ли у нас хорошо:
# df -h /mnt/yandex.disk/
Если всё нормально, то мы получим примерно следующий результат:
Filesystem                Size  Used Avail Use% Mounted on
https://webdav.yandex.ru   50G  1000M   49G   2% /mnt/yandex.disk

3 Убедившичь что всё работает размонтируем облако
sudo umount /mnt/yandex.disk/

### BackupWSYD.sh
Скрипт запускается на стороне сервера.
Скрипт запрашует логин и пароль затем подключает облако yandex (нужно быть предварительно зарегистрированным).
Далее создаёт файл бэкапа на вашем сервере по адресу /home/backup/ и будет иметь вид backup_2018-06-16.tar
Если в каталоге были старые бекапы то скрипт удалит их.
Во время работы попросит ввести пароль root базы данных для её копирования. При желании в скрипте можно указать пользователя и базу данных.
В итоге бэкап будет перемещён в смонтированный каталог /mnt/yandex.disk/, после чего yndex диск будет отмонтирован.

### RestoreWSYD.sh
Скрипт запускается на стороне сервера.
Запросив логин и пароль скрипт примонтирует yandex диск, после чего скопирует ваш бэкап из дериктории /yandex.disk/backup/  в директорию /home/backup/. Важно чтобы на яндексе в директории /yandex.disk/backup/ он был один.
Далее скрипт восстановит файлы веб сервера, файлы сайта и базы данных с бекапа.
Также убедитесь что по данному адресу находится только один нужный вам бэкап.
Во время работы попросит ввести пароль root базы данных для её копопирования.
После восстановления очистит директорию /home/backup/ и отмонтирует yandex диск.
В конечном итоге перезагружает apache2 и mysql.

## Cloning an Existing Repository ( Clone with HTTPS )

git clone https://github.com/AnatoliiKyrylenko/Backup-Web-Server.git

## Cloning an Existing Repository ( Clone with SSH )

git clone git@github.com:AnatoliiKyrylenko/Backup-Web-Server.git

---

Mail : AnatoliiKyrylenko@gmail.com

Linkedin : https://www.linkedin.com/in/anatolii-kyrylenko

GitHub : https://github.com/AnatoliiKyrylenko

