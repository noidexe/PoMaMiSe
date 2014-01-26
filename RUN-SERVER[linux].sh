#!/bin/sh
drop start
sleep 5
cd server
if [[ -e XXX-SERVER-ONLINE-XXX.txt ]]
then
  cat XXX-SERVER-ONLINE-XXX.txt
exit
else
while [ `drop status` != "Idle" ]; do
  echo Waiting for Dropbox to finish syncing..
  sleep 5
done
noip2 -K `pidof noip2`
noip2 -c No-IP/no-ip2.conf
echo "$(hostname)\\$(whoami) is running the server, DO NOT RUN!" > XXX-SERVER-ONLINE-XXX.txt
cp --verbose online.png ../../Public/.minecraft-online.png
stopdrop.sh &
java -jar ./PortMapper.jar -d 25565 TCP
java -jar ./PortMapper.jar -r 25565 TCP
java -jar ./PortMapper.jar -d 25575 TCP
java -jar ./PortMapper.jar -r 25575 TCP
./bukkit.sh
rm ../../Public/.minecraft-online.png
drop start
sleep 5
rm XXX-SERVER-ONLINE-XXX.txt
noip2 -K `pidof noip2`
fi

