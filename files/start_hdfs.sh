#!/bin/bash
git clone https://github.com/big-data-europe/docker-hadoop.git
cd docker-hadoop
docker -H tcp://master:4000 run -d --name namenode -v /srv/hadoop/namenode:/hadoop/dfs/name --net=bde_net -h namenode.hadoop -e constraint:node==master -e CLUSTER_NAME=bde-cluster --env-file=./hadoop.env bde2020/hadoop-namenode:1.0.0
docker -H tcp://master:4000 run -d --name resourcemanager --net=bde_net -h resourcemanager.hadoop -e constraint:node==master --env-file=./hadoop.env bde2020/hadoop-resourcemanager:1.0.0
docker -H tcp://master:4000 run -d --name historyserver -v /srv/hadoop/historyserver:/hadoop/dfs/name --net=bde_net -h historyserver.hadoop -e constraint:node==master --env-file=./hadoop.env bde2020/hadoop-historyserver:1.0.0
docker -H tcp://master:4000 run -d --name nodemanager1 --net=hadoop -h nodemanager1.hadoop -e constraint:node==master  --env-file=./hadoop.env bde2020/hadoop-nodemanager:1.0.0
docker -H tcp://master:4000 run -d --name datanode1 -v /srv/hadoop/datanode:/hadoop/dfs/data --net=bde_net -h datanode1.hadoop -e constraint:node==slave1 --env-file=./hadoop.env bde2020/hadoop-datanode:1.0.0
docker -H tcp://master:4000 run -d --name datanode2 -v /srv/hadoop/datanode:/hadoop/dfs/data --net=bde_net -h datanode2.hadoop -e constraint:node==slave2 --env-file=./hadoop.env bde2020/hadoop-datanode:1.0.0
docker -H tcp://master:4000 run -d --name datanode3 -v /srv/hadoop/datanode:/hadoop/dfs/data --net=bde_net -h datanode3.hadoop -e constraint:node==slave3 --env-file=./hadoop.env bde2020/hadoop-datanode:1.0.0
docker -H tcp://master:4000 run -d --name datanode4 -v /srv/hadoop/datanode:/hadoop/dfs/data --net=bde_net -h datanode4.hadoop -e constraint:node==slave4 --env-file=./hadoop.env bde2020/hadoop-datanode:1.0.0
cd ..
rm -r docker-hadoop
