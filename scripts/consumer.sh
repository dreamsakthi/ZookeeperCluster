#!/bin/bash

if [ $# -gt 0 ]; then
    $HOME/kafka_2.10-0.9.0.1/bin/kafka-console-consumer.sh --from-beginning --topic $1 --zookeeper 192.168.33.2:2181,192.168.33.3:2181,192.168.33.4:2181
else
    echo "Usage: "$(basename $0)" <topic_name>"
fi

