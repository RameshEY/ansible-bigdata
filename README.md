# Ansible for BDE infrastructure

This playbook is used to configure a BigDataEurope (BDE) cluster. 
It configures the network interfaces of the machines, installs auxiliary packages, installs Docker Engine and Docker Compose in every node and finally sets up Docker Swarm.

The cluster consists of a gateway node (which can be omitted), Swarm manager nodes and Swarm worker nodes. 

More info about the cluster deployment can be found at 
https://www.big-data-europe.eu/wp-content/uploads/D5.1_Generic_Big_Data_Integrator_Instance_I.pdf.

There are several configuration files for this playbook:

● **ansible.cfg** defines the username used for deployment.

● **hosts** configures the way your machine connects to the cluster members over SSH and the Swarm managers and workers.

● **files/hosts** defines the hostnames of the machines in the cluster, It is used as the machines' hosts file.

● **files/bdegw_interfaces** configures the network interface that will be used by the gateway node.

● **files/daemon.json** configures the Docker daemon of each node.


To deploy the gateway node (optional) issue

`ansible-playbook playbook.yaml -i hosts --limit gateway -K -vvvv`

To deploy a Docker Swarm issue

`ansible-playbook playbook.yaml -i hosts --limit swarm_nodes -K -vvvv`

This has been tested with Ansible 2.3.2.0, Ubuntu 16.04.3, Docker 17.09.0 CE and Docker Compose 1.17.1.