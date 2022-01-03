## Load Test With Jmeter
Throughout this code you can simply run a jmeter test using several powerful technologies allowing you to easily analyze and monitor your test plans in real time in an automated way (docker-compose).
## Main features
This repo provides several features to the user such as:
- `Load test scenario creation:` In this part we are going to create different environments consisting of multiple IP addresses (containers)
- `Persist test results:` It consists of persisting each test data in a database in addition to a log file and result csv file.
- `Environments monitoring:` It is about monitoring the containers of host docker engine and load test metrics.
- `Dockerize the stack:` Will give us the ability to run tests easier, and not to worry much about the environment we are working on.
## Quick start

Starting the test will only take few steps:
-Clone the repository in:
```sh
$ git clone https://github.com/LQss11/Jmeter-telegraf-influxdb-grafana.git
```
-The following command will run our docker-compose file which in fact will build our specified images with context then create and run our containers in  the same network:
```sh
$ docker-compose up --build
```
-Then connect to jmeter's container and chose whether you want to run the load test in a single machine (run.sh) or in a distributed mode (run-dist.sh):
```sh
docker exec -it jmeter bin/bash ./Scripts/run.sh

```
```sh
docker exec -it jmeter bin/bash ./Scripts/run-dist.sh

```
## Tools
This project was made by a combination of coll tools such as:
| Tools | Links | Version |
| ------ | ------ | ------ |
| InfluxDB | [Official website](https://www.influxdata.com/) | influxdb:2.0 |
| Grafana | [Official website](https://grafana.com/) | grafana/grafana:7.3.0 |
| Apache Jmeter | [Official website](https://jmeter.apache.org/) | JMETER 5.3 |
| Telegraf | [Git](https://github.com/influxdata/telegraf/) | telegraf:1.21 |
| Docker | [Official website](https://www.docker.com/) | Docker 20.10.7 |
## Additional information
1. .env file contains all variables used for the docker-compose.yml file
1. You can have more information about the telegraf.conf file which is responsible on setting up the specific data we want to collect from our docker host. for more information click [here](https://docs.influxdata.com/telegraf/v1.20/administration/configuration/).
1. In this project we used an influxdb version that uses Next-Generation InfluxDB 2.0 Platform but with SQL instead of FlexQL since the majority of grafana's dashboards are available with SQL not FlexQL.
