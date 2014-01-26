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
echo.RECORDA QUE PARA CERRAR EL SERVER SE
echo.USA EL COMMANDO 'stop'. NO CERRAR CON
echo.alt-f4 O CERRANDO LA VENTANA
echo.======================================
PAUSE
if not exist XXX-SERVER-ONLINE-XXX.txt (
	echo.### > XXX-SERVER-ONLINE-XXX.txt
	echo.### >> XXX-SERVER-ONLINE-XXX.txt
	echo.[%date% %time%]EL SERVER ESTA SIENDO EJECUTADO EL POR  %computername%\%username%, NO EJECUTAR!!! >> XXX-SERVER-ONLINE-XXX.txt
	echo.### >> XXX-SERVER-ONLINE-XXX.txt
	echo.### >> XXX-SERVER-ONLINE-XXX.txt
	echo.Si estas completamente seguro/a de que nadie esta ejecutando el server, >> XXX-SERVER-ONLINE-XXX.txt
	echo.elimina el archivo Dropbox/MCserver/server/XXX-SERVER-ONLINE-XXX.txt y proba de nuevo >> XXX-SERVER-ONLINE-XXX.txt
	taskkill /f /im duc30.exe > NUL
	start /b No-IP\duc30.exe
	copy /y online.png ..\..\Public\.minecraft-online.png > NUL
	start /min mapports.cmd
	start /min "Cerrando Dropbox en 30s" ..\stopdrop.cmd
	call bukkit.bat
	taskkill /f /im duc30.exe > NUL
	call rundropbox.cmd
	del XXX-SERVER-ONLINE-XXX.txt
	del ..\..\Public\.minecraft-online.png > NUL
	) ELSE type XXX-SERVER-ONLINE-XXX.txt
PAUSE
