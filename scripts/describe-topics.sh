#!/bin/bash

$HOME/kafka_2.10-0.9.0.1/bin/kafka-topics.sh --describe --zookeeper 192.168.33.2:2181,192.168.33.3:2181,192.168.33.4:2181
