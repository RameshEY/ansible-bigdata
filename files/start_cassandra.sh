#!/bin/bash
docker -H tcp://master:4000 run -d --name cassandra-cluster-1 -v /srv/cassandra:/var/lib/cassandra --net=bde_net -e constraint:node==slave1 cassandra:2.2.4
sleep 60
docker -H tcp://master:4000 run -d --name cassandra-cluster-2 -v /srv/cassandra:/var/lib/cassandra --net=bde_net -e constraint:node==slave2 -e CASSANDRA_SEEDS="$(docker -H tcp://master:4000 inspect --format='{{ .NetworkSettings.Networks.bde_net.IPAddress }}' cassandra-cluster-1)" cassandra:2.2.4'
sleep 60
docker -H tcp://master:4000 run -d --name cassandra-cluster-3 -v /srv/cassandra:/var/lib/cassandra --net=bde_net -e constraint:node==slave3 -e CASSANDRA_SEEDS="$(docker -H tcp://master:4000 inspect --format='{{ .NetworkSettings.Networks.bde_net.IPAddress }}' cassandra-cluster-1)" cassandra:2.2.4
sleep 60
docker -H tcp://master:4000 run -d --name cassandra-cluster-4 -v /srv/cassandra:/var/lib/cassandra --net=bde_net -e constraint:node==slave4 -e CASSANDRA_SEEDS="$(docker -H tcp://master:4000 inspect --format='{{ .NetworkSettings.Networks.bde_net.IPAddress }}' cassandra-cluster-1)" cassandra:2.2.4

