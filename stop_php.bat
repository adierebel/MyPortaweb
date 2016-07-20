@echo off
title Stop PHP Built-in Webserver
echo  Stopping PHP Built-in Webserver...
Taskkill /IM php.exe /F
echo  PHP Built-in Webserver Stopped
@pause