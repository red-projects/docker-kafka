#!/bin/bash

bin/zookeeper-server-start.sh config/zookeeper.properties > /app/zookeeper_out 2>&1 &
sleep 4
