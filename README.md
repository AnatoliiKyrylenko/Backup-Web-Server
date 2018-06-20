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

# Programming Languages:

    BASH

# System:

    Linux

# Tested  

    Ubuntu 16

# RUN

\# bash ./BackupWS.sh (or any another script)

# Explanation

BackupWS.sh

Скрипт BackupWS.sh создаст файл бэкапа на вашем сервере по адресу /home/backup/ и будет иметь вид backup_2018-06-16.tar
Если в каталоге были старые бекапы то удалит их.
Во время работы попросит ввести пароль root базы данных для её копопирования.

Далее вы можите использовать либо сторонний софт такой как FileZilla, либо предложенную мной команду для копирования файла бэкапа к себе на устройство.

Команда для копирования бэкапа на домашний компьютер:
scp -p 22 user@your_web_ip:/home/backup/* /home/backup/

Где user - имя вашего пользователя на сервере, your_web_ip - ip адрес сервера, /home/buckup/ - каталог на домашней машине, предварительно убедитесь что он существует, или укажите другой.

RestoreWS.sh

Скрипт запускается на стороне сервера.
RestoreWS.sh восстановит файлы веб сервера, файлы сайта и базы данных с бекапа находящегося в /home/backup/
Если в каталоге были старые бекапы то удалит их.
Во время работы попросит ввести пароль root базы данных для её копопирования.

Как и вслучае создания бэкапа, вы можите использовать либо сторонний софт такой как FileZilla, либо предложенную мной команду для копирования файла бэкапа на Web сервер.

Команда для копирования бэкапа с домашнего компьютера на сервер:
scp -p 22 /home/backup/backup_ver user@your_web_ip:/home/backup/

Где backup_ver - название нужной версии бэкапа для восстановления, user - имя вашего пользователя на сервере, your_web_ip - ip адрес сервера, /home/buckup/ - каталог на домашней машине, предварительно убедитесь что он существует, или укажите другой.

## Cloning an Existing Repository ( Clone with HTTPS )

git clone https://github.com/AnatoliiKyrylenko/Backup-Web-Server.git

## Cloning an Existing Repository ( Clone with SSH )

git clone git@github.com:AnatoliiKyrylenko/Backup-Web-Server.git

---

Mail : AnatoliiKyrylenko@gmail.com

Linkedin : https://www.linkedin.com/in/anatolii-kyrylenko

GitHub : https://github.com/AnatoliiKyrylenko

