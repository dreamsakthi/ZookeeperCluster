#!/bin/bash

if [ $# -gt 0 ]; then
   $HOME/kafka_2.10-0.9.0.1/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list 192.168.33.10:9092,192.168.33.20:9092,192.168.33.30:9092 --topic $1 --time -1
else
    echo "Usage: "$(basename $0)" <topic_name>"
fi
