#!/bin/bash
# usage ./sendmsgtotopic.sh <topic_name>
cd /usr/local/kafka
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1
