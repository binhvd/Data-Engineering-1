#!/bin/bash

/usr/local/hadoop/sbin/stop-dfs.sh
/usr/local/hadoop/bin/hadoop namenode -format
/usr/local/hadoop/sbin/start-dfs.sh



