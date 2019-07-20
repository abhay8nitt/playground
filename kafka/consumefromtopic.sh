#!/bin/bash
# usage ./consumefromtopic.sh <topic_name>
cd /usr/local/kafka
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
