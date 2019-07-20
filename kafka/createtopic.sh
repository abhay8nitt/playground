#!/bin/bash
# usage ./createtopic.sh <topic_name>
cd /usr/local/kafka
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic $1
