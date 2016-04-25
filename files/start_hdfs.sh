#!/bin/bash
docker -H tcp://master:4000 run -d --name namenode  -p 8020:8020 -p 50070:50070 -v /srv/hdfs:/hdfs-data --net=bde_net -e constraint:node==master bde2020/hadoop-namenode
docker -H tcp://master:4000 run -d --name datanode1 -v /srv/hdfs:/hdfs-data --net=bde_net -e constraint:node==slave1 bde2020/hadoop-datanode
docker -H tcp://master:4000 run -d --name datanode2 -v /srv/hdfs:/hdfs-data --net=bde_net -e constraint:node==slave2 bde2020/hadoop-datanode
docker -H tcp://master:4000 run -d --name datanode3 -v /srv/hdfs:/hdfs-data --net=bde_net -e constraint:node==slave3 bde2020/hadoop-datanode
docker -H tcp://master:4000 run -d --name datanode4 -v /srv/hdfs:/hdfs-data --net=bde_net -e constraint:node==slave4 bde2020/hadoop-datanode

