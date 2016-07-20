@echo off
title Start PHP Built-in Webserver
echo  Starting PHP Built-in Webserver...
start php\php.exe -S 127.0.0.1:8181 -t "%CD%\www" -c "%CD%\php\php.ini"
