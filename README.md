# ansible

This script configures the network interfaces, installs auxiliary packages, deploys and
configures Docker Swarm in a cluster. Cassandra and Hadoop are also deployed in the Swarm by default. 
The cluster consists of a gateway node, a master node and slave nodes. More info about the cluster deployment can be found at 
https://www.big-data-europe.eu/wp-content/uploads/D5.1_Generic_Big_Data_Integrator_Instance_I.pdf.

There are several configuration files to modify the Ansible script.

● **ansible.cfg** defines the username used for deployment.

● **hosts configures** the way your machine connects to the cluster members over ssh.

● **files/hosts defines** the hostnames of the machines in the cluster, it is used as the machines' hosts file.

● **files/bdegw_interfaces** configures the network interface that will be used by the gateway node.

This has been tested with Ansible 2.1.0.
