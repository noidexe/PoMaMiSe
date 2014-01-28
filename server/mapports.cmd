@echo off
echo Mappig ports
call java -jar PortMapper.jar -d 25565 TCP
call java -jar PortMapper.jar -r 25565 TCP
call java -jar PortMapper.jar -d 25575 TCP
call java -jar PortMapper.jar -r 25575 TCP
exit
