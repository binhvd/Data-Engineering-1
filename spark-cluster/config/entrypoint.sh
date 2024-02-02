#!/usr/bin/env bash

set -e

# Change dns config
HDFS_SITE="/usr/local/hadoop/etc/hadoop/hdfs-site.xml"
NETWORK="tailscale0"

if [ -d "/sys/class/net/$NETWORK" ]; then
	sed -i "/dfs.datanode.dns.interface/{n;s/default/$NETWORK/}" $HDFS_SITE
fi

# Start services in the background
service ssh start

# Do nothing and just keep the container alive
sleep infinity
