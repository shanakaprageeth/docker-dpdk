#!/bin/bash -ex
# author Shanaka Prageeth
# details this script will execute rhel-dpdk container based on rhel8-dpdk docker image

DEBIAN_FRONTEND=noninteractive
PROGRAM_NAME="$(basename $0)"
BASEDIR=$(dirname $(realpath "$0"))

# build docker file if argument is provided
if [ "$1" == "build" ]; then
    docker build -t rhel8-dpdk .
    docker run --privileged  --cap-add=ALL \
        -v /sys/bus/pci/devices:/sys/bus/pci/devices \
        -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
        -v /sys/devices/system/node:/sys/devices/system/node \
        -v /dev:/dev \
        -v /home/$USER:/home/$USER \
        --name rhel-dpdk -it  rhel8-dpdk bash
else
    # pull from docker hub
    docker run --privileged  --cap-add=ALL \
        -v /sys/bus/pci/devices:/sys/bus/pci/devices \
        -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
        -v /sys/devices/system/node:/sys/devices/system/node \
        -v /dev:/dev \
        -v /home/$USER:/home/$USER \
        --name rhel-dpdk -it  shanakaprageeth/rhel8-dpdk bash
fi

#docker exec rhel-dpdk bash -c "/root/dpdk/usertools/dpdk-hugepages.py -p 2048K --setup 2M --node 0 && cat /proc/meminfo | grep HugePages"
#docker exec rhel-dpdk bash -c "cat /proc/meminfo | grep HugePages"
#docker exec rhel-dpdk bash -c "/root/dpdk/build/examples/dpdk-helloworld -l 0-1 -n 1"
