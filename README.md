![Docker build](https://github.com/shanakaprageeth/docker-dpdk/actions/workflows/.ci.yml/badge.svg)

# docker-dpdk for ubuntu and RockyLinux/Rhel

Note: Current RHEL images use RockyLinux. Please edit the Dockerfile to build RHEL yourself. You might require to fill RHEL subscription details in Dockerfile.

These scripts will create a docker container to build and run dpdk-dev on docker in ubuntu or rocylinux/rhel host machines. The containers contains a prebuild dpdk source.
You have to configure host machine for huge pages and mount drivers to docker. Please refer the install-image-with-docker.sh command.
In adiitionally, this script will mount your home directory to container. Please comment this out in production as it will mount your secrets such as .ssh to container.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

RockyLinux/RHEL or Ubuntu installation.
DPDK supported NIC.
Docker-deamon.

### Installing
For Ubuntu
execute following script with administrative privillages to create the docker container.
```
./install-image-with-docker.sh
```
OR 
use my docker-dpdk image on docker hub
[shanakaprageeth/ubuntu-dpdk](https://hub.docker.com/r/shanakaprageeth/ubuntu24-dpdk)

For RockyLinux/RHEL

Please edit rhel subscription manager USERNAME and PASSWORD or else set up yum in DOCKERFILE.
execute following script with administrative privillages to create the docker container.
```
./install-image-with-docker.sh 
``` 

### About Exeucting the container

Following docker container options and mounts are required for dpdk

```
# Ubuntu
docker run --privileged  --cap-add=ALL \
        -v /sys/bus/pci/devices:/sys/bus/pci/devices \
        -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
        -v /sys/devices/system/node:/sys/devices/system/node \
        -v /dev:/dev \
        -v /home/$USER:/home/$USER \
        --name ubuntu-dpdk -it  shanakaprageeth/ubuntu24-dpdk bash

#RockyLinux
docker run --privileged  --cap-add=ALL \
        -v /sys/bus/pci/devices:/sys/bus/pci/devices \
        -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
        -v /sys/devices/system/node:/sys/devices/system/node \
        -v /dev:/dev \
        -v /home/$USER:/home/$USER \
        --name rhel-dpdk -it  shanakaprageeth/rhel8-dpdk bash
```

## Old version

Please refer to branch/tag 1.0 for old Docker containers with dpdk-setup.sh [1.0](https://github.com/shanakaprageeth/docker-dpdk/tree/1.0.0)

## Acknowledgments
* I pay my gratitude dpdk-dev library. dpdk_setup.sh contain shell functions used in dpdk-dev library.
* Can you run Intel's Data-plane Development Kit (DPDK) in a container?  Yep.
  http://developerblog.redhat.com/2015/06/02/can-you-run-intels-data-plane-development-kit-dpdk-in-a-docker-container-yep/
* I pay my gratitude to https://github.com/jeremyeder/docker-dpdk that provide me information for rhel dpdk support.

