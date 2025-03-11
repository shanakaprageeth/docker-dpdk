![Docker build](https://github.com/shanakaprageeth/docker-dpdk/actions/workflows/.ci.yml/badge.svg)

# docker-dpdk for ubuntu and rhel

These scripts will create a docker container to build and run dpdk-dev on docker in ubuntu or rocylinux/rhel host machines, Please use the same 
OS container. Ubuntu container contains a prebuild dpdk source. However, rhel or rockylinux container only contains the source configuration that require you to build yourself. Please refer to Dockerfile comments.
Also you can use the home directory to mount pre-build dpdk source in to docker.

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

Afterwards, build and setup dpdk inside the container

## Old version

Please refer to branch/tag 1.0 for old Docker containers with dpdk-setup.sh

## Acknowledgments
* I pay my gratitude dpdk-dev library. dpdk_setup.sh contain shell functions used in dpdk-dev library.
* Can you run Intel's Data-plane Development Kit (DPDK) in a container?  Yep.
  http://developerblog.redhat.com/2015/06/02/can-you-run-intels-data-plane-development-kit-dpdk-in-a-docker-container-yep/
* I pay my gratitude to https://github.com/jeremyeder/docker-dpdk that provide me information for rhel dpdk support.

