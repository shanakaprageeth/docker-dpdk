#! /bin/bash

# build docker file
docker build -t rhel-dpdk .
docker run --privileged  --cap-add=ALL -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev --name rhel-dpdk -it  rhel-dpdk bash





