#------------------------------------------------Monitoring--------------------------------------------#
$docker-compose up -d

Open influx --> Data --> Buckets --> Copy to clipboard Jmeter's Bucker ID
eXECUTE THIS COMMAND TO ADD A NEW DATABASE IN ORDER TO USE influxdb OLD versions dashboard with newer influxdb version (1.8 or higher)
influx v1 dbrp create --db jmeter --rp autogen --bucket-id 482b13ff5761a956 --default --org Spark --token mytoken
