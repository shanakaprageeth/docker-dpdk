#! /bin/bash

# build docker file
sudo su
docker build -t shanakaprageeth/ubuntu-dpdk .
docker run --privileged  --cap-add=ALL --name ubuntu-dpdk -it  ubuntu-dpdk bash


# pull from docker hub
#docker run --privileged  --cap-add=ALL --name ubuntu-dpdk -it  shanakaprageeth/ubuntu-dpdk bash



