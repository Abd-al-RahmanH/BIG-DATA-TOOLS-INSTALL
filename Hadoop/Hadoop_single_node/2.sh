#!/bin/bash

# SSH key setup for Hadoop
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod og-wx ~/.ssh/authorized_keys

# Configure Hadoop environment variables in hadoop-env.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

# Navigate to the Hadoop configuration directory
cd $HADOOP_HOME/etc/hadoop

# Configure core-site.xml
cat > core-site.xml << EOL
<configuration>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://ec2-18-234-51-29.compute-1.amazonaws.com:9000</value>
  </property>
</configuration>
EOL

# Configure hdfs-site.xml
cat > hdfs-site.xml << EOL
<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
  <property>
    <name>dfs.namenode.name.dir</name>
    <value>file:///home/ubuntu/hadoop/hadoopdata/hdfs/namenode</value>
  </property>
  <property>
    <name>dfs.datanode.data.dir</name>
    <value>file:///home/ubuntu/hadoop/hadoopdata/hdfs/datanode</value>
  </property>
</configuration>
EOL

# Configure yarn-site.xml
cat > yarn-site.xml << EOL
<configuration>
  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
  <property>
    <name>yarn.nodemanager.auxservices.mapreduce.shuffle.class</name>
    <value>org.apache.hadoop.mapred.ShuffleHandler</value>
  </property>
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>ec2-18-234-51-29.compute-1.amazonaws.com</value>
  </property>
</configuration>
EOL

# Configure mapred-site.xml
cat > mapred-site.xml << EOL
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
  <property>
    <name>mapreduce.jobtracker.address</name>
    <value>ec2-18-234-51-29.compute-1.amazonaws.com:8021</value>
  </property>
</configuration>
EOL

# Update /etc/hosts (requires sudo)
sudo sed -i '/127.0.0.1 localhost/d' /etc/hosts
echo "172.31.30.69 ec2-18-234-51-29.compute-1.amazonaws.com" | sudo tee -a /etc/hosts

# Format Hadoop namenode
cd $HADOOP_HOME
hadoop namenode -format

# Start Hadoop services
cd $HADOOP_HOME/sbin
./start-all.sh

# Check Hadoop processes
jps

# Start the DFS
start-dfs.sh

echo "Hadoop setup completed successfully."
