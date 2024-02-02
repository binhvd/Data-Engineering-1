#!/bin/bash

sudo docker volume rm hdfs_master_data
sudo docker volume rm hdfs_master_index
sudo docker volume rm hdfs_master_checkpoint
sudo docker volume rm hdfs_worker_data