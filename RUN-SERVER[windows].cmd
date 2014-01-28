@echo OFF
cd server
if exist XXX-SERVER-ONLINE-XXX.txt (
	type XXX-SERVER-ONLINE-XXX.txt
	PAUSE
	exit
	)

echo.===============
echo. IMPORTANT!!!
echo.===============
call rundropbox.cmd
echo.
echo.
echo.
echo.Check that the folder called 'server' and
echo.its conents are not being updated by Dropbox
echo.You could be receiving updates from the last person to host
echo.and you don't want to running until it has finished syncing
:updating
echo.
echo.
echo.
echo.Let's wait till all the files and folders inside
echo.'server' have a green tick..
echo.
echo.Did Dropbox finish syncing the server files?
choice
if errorlevel 2 goto updating
if errorlevel 1 goto running
echo THERE HAS BEEN AN ERROR
PAUSE
exit

:running
echo.
echo.======================================
echo.REMEMBER TO USE THE 'stop' COMMAND TO
echo.SHUT DOWN THE SERVER. NEVER DO IT BY
echo.PRESSING ALT-F4 OR CLOSING THE WINDOW
echo.======================================
PAUSE
if not exist XXX-SERVER-ONLINE-XXX.txt (
	echo.### > XXX-SERVER-ONLINE-XXX.txt
	echo.### >> XXX-SERVER-ONLINE-XXX.txt
	echo.[%date% %time%]THE SERVER IS BEING RUN BY %computername%\%username%, DO NOT RUN!!! >> XXX-SERVER-ONLINE-XXX.txt
	echo.### >> XXX-SERVER-ONLINE-XXX.txt
	echo.### >> XXX-SERVER-ONLINE-XXX.txt
	echo.If youre completely sure nobody is running the server, >> XXX-SERVER-ONLINE-XXX.txt
	echo.please delete Dropbox/MCserver/server/XXX-SERVER-ONLINE-XXX.txt and try again >> XXX-SERVER-ONLINE-XXX.txt
	taskkill /f /im duc30.exe > NUL
	start /b No-IP\duc30.exe
	copy /y online.png ..\..\Public\.minecraft-online.png > NUL
	start /min mapports.cmd
	start /min "Stopping Dropbox in 30s" ..\stopdrop.cmd
	call bukkit.bat
	taskkill /f /im duc30.exe > NUL
	call rundropbox.cmd
	del XXX-SERVER-ONLINE-XXX.txt
	del ..\..\Public\.minecraft-online.png > NUL
	) ELSE type XXX-SERVER-ONLINE-XXX.txt
PAUSE
