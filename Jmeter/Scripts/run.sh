#!/bin/bash -e
#define variables to store info
version=5.3
scriptname="GoogleTest"
DN="`date`"
DATE_NOW=${DN// /_}
JVM_ARGS="-Xms512m -Xmx2048m" jmeter -Jjmeter.save.saveservice.subresults=false -n -t /JMX/${scriptname}.jmx -f -l /results/output/$DATE_NOW/${scriptname}.jtl  -e -o /results/output/$DATE_NOW/dashboard -j /results/output/$DATE_NOW/jmeter.log 2>&1
java -jar /opt/apache-jmeter-${version}/lib/cmdrunner-2.2.jar --tool Reporter --plugin-type AggregateReport --input-jtl /results/output/$DATE_NOW/${scriptname}.jtl --generate-csv /results/output/$DATE_NOW/results.csv 2>&1
cat /results/output/$DATE_NOW/results.csv