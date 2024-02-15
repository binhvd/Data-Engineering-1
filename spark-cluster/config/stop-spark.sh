#!/bin/bash

if [ $(hostname) = "master-node" ]; then
	$SPARK_HOME/sbin/stop-master.sh
	exit
fi
$SPARK_HOME/sbin/stop-worker.sh