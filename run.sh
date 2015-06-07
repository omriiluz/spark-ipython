#!/bin/bash

source /root/spark_files/configure_spark.sh

IP=$(ip -o -4 addr list eth0 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')
echo "IP=$IP"

echo "preparing Spark"
prepare_spark $IP

PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS='notebook' pyspark --packages TargetHolding/pyspark-cassandra:0.1.5 --driver-memory 4g --executor-memory 4g
