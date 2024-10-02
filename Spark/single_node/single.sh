#!/bin/bash

# Step 1: Download Spark (using your specified link)
echo -e "\n\e[1;34mDownloading Apache Spark 3.5.3...\e[0m"
wget https://dlcdn.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz

# Step 2: Extract the downloaded Spark tarball
echo -e "\n\e[1;34mExtracting Spark archive...\e[0m"
tar -zxvf spark-3.5.3-bin-hadoop3.tgz

# Step 3: Move into the extracted Spark directory
cd spark-3.5.3-bin-hadoop3

# Step 4: Configure environment variables
echo -e "\n\e[1;34mSetting up Spark configuration...\e[0m"
cd conf
cp spark-env.sh.template spark-env.sh

# Step 5: Set up JAVA_HOME in the Spark environment configuration
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
echo "export JAVA_HOME=$JAVA_HOME" >> spark-env.sh

# Step 6: Return to the Spark root directory
cd ..

# Step 7: Provide comments for the commands below
# Run the Spark Shell for Scala by using the command below:
# `bin/spark-shell`
# - The `spark-shell` command opens the interactive Spark Shell for executing Scala code.
# - It allows you to run and test your Spark Scala applications interactively.

# Launch Spark Shell for Scala
echo -e "\n\e[1;34mStarting Spark Shell (Scala)...\e[0m"
bin/spark-shell --version

# Step 8: Run the PySpark shell for Python by using the command below:
# `bin/pyspark`
# - PySpark allows you to interactively run Spark operations in Python.
# - Useful for executing Python-based Spark applications.

# Launch PySpark for Python
echo -e "\n\e[1;34mStarting PySpark Shell...\e[0m"
bin/pyspark --version

# Step 9: Start all Spark services
echo -e "\n\e[1;34mStarting all Spark services...\e[0m"
sbin/start-all.sh

# Step 10: Check running Spark and Hadoop services
echo -e "\n\e[1;34mChecking running Java processes...\e[0m"
jps

# Step 11: Final message for the user to access Spark UI on port 8080
echo -e "\n\e[1;32mSpark has been successfully set up and started!\e[0m"
echo -e "\n\e[1;33mYou can access the Spark Web UI at: \e[1;34mhttp://localhost:8080\e[0m"
