@echo off
echo.STOPING DROPBOX IN 30s...
ping 192.0.2.2 -n 1 -w 30000 > NUL
taskkill /f /im dropbox.exe > NUL
exit
