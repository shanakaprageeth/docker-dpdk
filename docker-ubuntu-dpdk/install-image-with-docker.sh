#! /bin/bash

# build docker file
sudo su
docker build -t ubuntu-dpdk .
docker run --privileged  --cap-add=ALL -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev --name ubuntu-dpdk -it  ubuntu-dpdk bash


# pull from docker hub
#docker run --privileged  --cap-add=ALL -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev --name ubuntu-dpdk -it  shanakaprageeth/ubuntu-dpdk bash



