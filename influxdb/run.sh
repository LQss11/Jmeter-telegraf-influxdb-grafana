#!/bin/bash
set -e
influx v1 dbrp create --db jmeter --rp autogen --bucket-id $(influx bucket list | grep Jmeter | awk '{print $1}') --default --org Spark --token mytoken