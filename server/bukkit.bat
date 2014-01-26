@ECHO OFF
SET BINDIR=%~dp0
CD /D "%BINDIR%"
"C:\Program Files\Java\jre7\bin\java.exe" -Xincgc -Xmx1024M -jar craftbukkit.jar
