FROM ubuntu:latest

# setup jmeter version to use
ARG JMETER_VERSION="5.3"
ARG JMETER_PLUGINS_MANAGER_VERSION="1.6"
ARG CMDRUNNER_VERSION="2.2"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV MIRROR_HOST https://archive.apache.org/dist/jmeter
ENV JMETER_DOWNLOAD_URL ${MIRROR_HOST}/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL https://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/
ENV PATH $PATH:$JMETER_BIN
ENV DEBIAN_FRONTEND noninteractive
# Install Everything.
RUN \
  sed -i -e 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu openjdk-8-jre curl git htop man unzip vim wget python3-pip && \
  mkdir -p /tmp/dependencies &&   \
  curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz &&  \
  mkdir -p /opt && \
  tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt &&  \
  rm -rf /tmp/dependencies && \
  rm -rf /var/lib/apt/lists/*
# Install jmeter lib and dependency jars
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-manager/${JMETER_PLUGINS_MANAGER_VERSION}/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar -o ${JMETER_HOME}/lib/cmdrunner-${CMDRUNNER_VERSION}.jar && \
    java -cp ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-manager-${JMETER_PLUGINS_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller && \
    PluginsManagerCMD.sh install jpgc-cmd=2.2,jpgc-dummy=0.4,jpgc-filterresults=2.2,jpgc-synthesis=2.2,jpgc-graphs-basic=2.0 \
    && jmeter --version \
    && PluginsManagerCMD.sh status \
RUN ln -nsf /usr/bin/pip3 /usr/bin/pip
RUN ln -nfs /usr/bin/python3 /usr/bin/python
#RUN pip3 install awscli && pip3 install xmltodict

# copy jmeter script files and any dependency files such as data and libraries

COPY GoogleTest.jmx /GoogleTest.jmx
COPY *.csv /

# shell script has script to convert Jmeter JTL results file to CSV
COPY run.sh /run.sh
COPY run-dist.sh /run-dist.sh
# Set environment variables.
ENV HOME /root

# Final cleanup
RUN apt-get --purge autoremove
RUN ["chmod", "+x", "/run.sh"]
RUN ["chmod", "+x", "/run-dist.sh"]
# Define working directory.
WORKDIR /