#!/bin/bash

read -p "Enter Container ID of the Master Node: " ID

#docker exec -it $ID /usr/local/hadoop/sbin/stop-all.sh
#docker exec -it $ID /usr/local/hadoop/bin/hadoop namenode -format
#docker exec -it $ID /usr/local/hadoop/sbin/start-all.sh
#sleep 10
docker exec -it $ID /usr/local/hadoop/sbin/start-all.sh
sleep 30

