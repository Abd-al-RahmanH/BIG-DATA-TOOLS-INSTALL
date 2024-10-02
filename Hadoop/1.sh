#!/bin/bash

# Update and install OpenJDK 11
sudo apt update
sudo apt install openjdk-11-jdk -y

# Check Java version
java -version

# Download and extract Hadoop
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.0/hadoop-3.4.0.tar.gz
tar -xvf hadoop-3.4.0.tar.gz
mv hadoop-3.4.0 /home/ubuntu/hadoop

# Set up environment variables in ~/.bashrc
echo 'export HADOOP_HOME=/home/ubuntu/hadoop' >> ~/.bashrc
echo 'export HADOOP_INSTALL=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin' >> ~/.bashrc

# Ensure ~/.bashrc is sourced correctly
echo "Hadoop environment variables have been set. Please source ~/.bashrc and run the second script."

