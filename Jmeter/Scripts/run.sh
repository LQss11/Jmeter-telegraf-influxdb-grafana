#!/bin/bash -e

# Define Jmeter version
version=5.3

# Read filename
while echo "Enter the JMX filename that is inside the /JMX directory (eg: examplefilename)"; do

    # echo "You can use one of the following files.."
    # for FILE in ../JMX/*; do
    #     echo $FILE
    # done
    read jmx_file_name
    scriptname=$jmx_file_name
    FILE=../JMX/$jmx_file_name.jmx

    if test -f "$FILE"; then
        echo "$FILE exists."
        break
    else
        echo "$FILE doesn't exist."
    fi

done


echo "Jmx file= $jmx_file_name.jmx"

# Get Date Now for unique test folders names
DN="`date`"
DATE_NOW=${DN// /_}

JVM_ARGS="-Xms512m -Xmx2048m" jmeter-Jjmeter.save.saveservice.subresults=false -n -t /JMX/${scriptname}.jmx -f -l /results/output/$DATE_NOW/${scriptname}.jtl  -e -o /results/output/$DATE_NOW/dashboard -j /results/output/$DATE_NOW/jmeter.log 2>&1
java -jar /opt/apache-jmeter-${version}/lib/cmdrunner-2.2.jar --tool Reporter --plugin-type AggregateReport --input-jtl /results/output/$DATE_NOW/${scriptname}.jtl --generate-csv /results/output/$DATE_NOW/results.csv 2>&1
cat /results/output/$DATE_NOW/results.csv