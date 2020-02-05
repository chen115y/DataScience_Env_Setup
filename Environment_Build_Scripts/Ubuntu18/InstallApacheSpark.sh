#!/bin/sh

echo
echo ----------install java 8-----------
echo
    sudo apt install -y openjdk-8-jdk
    sudo update-alternatives --config java
    sudo echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"" >> ~/.bashrc
    . ~/.bashrc
echo
echo ----------Install Spark 3.0 Preview----------
echo
    wget -P /tmp/ http://us.mirrors.quenda.co/apache/spark/spark-3.0.0-preview2/spark-3.0.0-preview2-bin-hadoop2.7.tgz
    sudo mkdir /usr/local/spark/
    sudo tar xvf /tmp/spark-3.0.0-preview2-bin-hadoop2.7.tgz -C /usr/local/spark
    sudo pip3 install pyspark findspark
    echo SPARK_HOME=/usr/local/spark/spark-3.0.0-preview2-bin-hadoop2.7 >> ~/.bashrc
    echo export SPARK_HOME=\$SPARK_HOME >> ~/.bashrc
    echo export PATH=\$SPARK_HOME/bin:\$PATH >> ~/.bashrc
    echo export PYSPARK_PYTHON=/usr/bin/python3
    echo export PYSPARK_DRIVER_PYTHON=python3
    echo export SPARK_LOCAL_IP=127.0.0.1 >> ~/.bashrc
    . ~/.bashrc
