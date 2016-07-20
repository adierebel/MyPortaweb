@echo off
title Stop MariaDB
echo  Stopping MariaDB...
mariadb\bin\mysqladmin.exe --port=3306 --user=root shutdown
echo  MariaDB Stopped
@pause
