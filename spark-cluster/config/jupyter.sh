#!/bin/bash

export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop

echo "Start Jupyter..."
cd /home/notebook
nohup jupyter notebook --allow-root --no-browser --NotebookApp.token='' --ip='*' > /home/big_data/jupyter.log &

