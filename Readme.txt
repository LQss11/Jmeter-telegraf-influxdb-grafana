#------------------------------------------------Monitoring--------------------------------------------#

cd monitoring 
$docker-compose up -d

Open influx --> Data --> Buckets --> Copy to clipboard Jmeter's Bucker ID
influx v1 dbrp create --db jmeter --rp autogen --bucket-id 482b13ff5761a956 --default --org Spark --token mytoken




#------------------------------------------------JMETER--------------------------------------------#

docker run --net jmetertest ^
-v "C:\Users\affes\OneDrive\Bureau\JMX\Final\Jmeter Dist Test\lib\jmeter.pack-listener-1.7.jar":/opt/apache-jmeter-5.3/lib/ext/jmeter.pack-listener-1.7.jar ^
-v "C:\Users\affes\OneDrive\Bureau\JMX\Final\Jmeter Dist Test":/mnt/jmeter ^
justb4/jmeter -n -X -Jclient.rmi.localport=7000 -Jserver.rmi.ssl.disable=true ^
-R slave-1,slave-2,slave-3 ^
-t /mnt/jmeter/SimplePortainerTest.jmx -l /mnt/jmeter/compose14/result.csv -j /mnt/jmeter/compose14/jmeter.log -e -o "/mnt/jmeter/compose14/logs"

PS: !!!! In order to run more slaves !!!!
	-add a new docker compose service as the same as other slaves just changing hostname and container name
	-create a csv file with name of the slave hostname
	-update docker host option -R adding the new added slaves