# Bash Script for Installing Hadoop Single Node Cluster

This guide provides steps to install a single-node Hadoop cluster using Bash scripts.

## Prerequisites

- Ensure you have Java installed on your system.
- You must have the necessary permissions to execute scripts.

## Steps to Install Hadoop

### Step 1: Make the Scripts Executable

Run the following command to make the scripts executable:

```bash
chmod +x 1.sh 2.sh
```

### Step 2: Execute the First Script

Run the first script to set up the initial Hadoop environment:

```bash
./1.sh
```

### Step 3: Source the `.bashrc` File

After running the first script, update your current shell session with the following command:

```bash
source .bashrc
```

**Note:** Make sure to change the private IP and DNS in the `2.sh` script before executing it.

### Step 4: Execute the Second Script

Run the second script to complete the installation and configuration of Hadoop:

```bash
./2.sh
```

### Step 5: Verify the Installation

Finally, check if Hadoop is installed correctly by running:

```bash
jps
```

You should see a list of running Hadoop processes.

## Conclusion

You have successfully installed a single-node Hadoop cluster. If you encounter any issues, please refer to the Hadoop documentation or seek help from the community.
```
 