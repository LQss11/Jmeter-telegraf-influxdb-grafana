#!/bin/bash -e
#define variables to store info
version=5.3
scriptname="GoogleTest"
#
# override the HEAP settings and run the jmeter script.
JVM_ARGS="-Xms512m -Xmx2048m" jmeter -Jjmeter.save.saveservice.subresults=false -n -t /${scriptname}.jmx -f -l /${scriptname}.jtl -e -o /results/output/"`date`" 2>&1
java -jar /opt/apache-jmeter-${version}/lib/cmdrunner-2.2.jar --tool Reporter --plugin-type AggregateReport --input-jtl /${scriptname}.jtl --generate-csv /results/results.csv 2>&1
cat /results/results.csv