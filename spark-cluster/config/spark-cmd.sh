#!/bin/bash

# Change dns config
echo "Updating DNS Config"
HDFS_SITE="/usr/local/hadoop/etc/hadoop/hdfs-site.xml"
NETWORK="tailscale0"

if [ -d "/sys/class/net/$NETWORK" ]; then
	sed -i "/dfs.datanode.dns.interface/{n;s/default/$NETWORK/}" $HDFS_SITE
fi

# Start services in the background
service ssh start

# Format on the first start
if [[ $1 = "start" ]] && [[ $2 = "master-node" ]] && [ ! -d "/home/hadoop/data/nameNode/current" ]; then
	$HADOOP_HOME/bin/hadoop namenode -format
fi
		
echo "Starting HDFS and Yarn"
$HADOOP_HOME/sbin/start-dfs.sh
sleep 5
$HADOOP_HOME/sbin/start-yarn.sh
sleep 5

if [[ $1 = "start" ]]; then
    if [[ $2 = "master-node" ]]; then
        /sbin/spark-3.4.0-bin-without-hadoop/sbin/start-master.sh

        # Starts history server to check running and completed applications
        /usr/local/hadoop/bin/hdfs dfs -mkdir -p /spark-logs
        /sbin/spark-3.4.0-bin-without-hadoop/sbin/start-history-server.sh

        # Disables safe mode to prevent errors in small clusters
        /usr/local/hadoop/bin/hdfs dfsadmin -safemode leave

        sleep infinity
        exit
    fi
    
    # Sleeps to prevent connection issues with master
    sleep 5
    /sbin/spark-3.4.0-bin-without-hadoop/sbin/start-worker.sh master-node:7077
	
    sleep infinity
    exit
fi

if [[ $1 = "stop" ]]; then
    if [[ $2 = "master-node" ]]; then
        /sbin/spark-3.4.0-bin-without-hadoop/sbin/stop-master.sh
        exit
    fi
    /sbin/spark-3.4.0-bin-without-hadoop/sbin/stop-worker.sh
fi
