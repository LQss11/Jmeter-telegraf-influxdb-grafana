#!/bin/bash -e
#define variables to store info
version=5.3
scriptname="GoogleTest"
DN="`date`"
DATE_NOW=${DN// /_}

#
# override the HEAP settings and run the jmeter script.
JVM_ARGS="-Xms512m -Xmx2048m" jmeter -n -X -Jclient.rmi.localport=7000 -Jserver.rmi.ssl.disable=true -R slave-1,slave-2 -Jjmeter.save.saveservice.subresults=false -t /${scriptname}.jmx -f -l /results/output/$DATE_NOW/${scriptname}.jtl -e -o /results/output/$DATE_NOW/dashboard -j /results/output/$DATE_NOW/jmeter.log 2>&1
java -jar /opt/apache-jmeter-${version}/lib/cmdrunner-2.2.jar --tool Reporter --plugin-type AggregateReport --input-jtl /results/output/$DATE_NOW/${scriptname}.jtl --generate-csv /results/results.csv 2>&1
cat /results/results.csv