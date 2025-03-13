#!/bin/bash -ex
# author Shanaka Prageeth
# details this script will execute ubuntu-dpdk container based on ubuntu24-dpdk docker image

DEBIAN_FRONTEND=noninteractive
PROGRAM_NAME="$(basename $0)"
BASEDIR=$(dirname $(realpath "$0"))

# Function to check if the script is run as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root"
        exit 1
    fi
}

# Check if the script is run as root
check_root

# build docker file if argument is provided
if [ "$1" == "build" ]; then
    docker build -t ubuntu24-dpdk .
    docker run --privileged  --cap-add=ALL \
        -v /sys/bus/pci/devices:/sys/bus/pci/devices \
        -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
        -v /sys/devices/system/node:/sys/devices/system/node \
        -v /dev:/dev \
        -v /home/$USER:/home/$USER \
        --name ubuntu-dpdk -it  ubuntu24-dpdk bash
else
    # pull from docker hub
    docker run --privileged  --cap-add=ALL \
        -v /sys/bus/pci/devices:/sys/bus/pci/devices \
        -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
        -v /sys/devices/system/node:/sys/devices/system/node \
        -v /dev:/dev \
        -v /home/$USER:/home/$USER \
        --name ubuntu-dpdk -it  shanakaprageeth/ubuntu24-dpdk bash
fi

#docker exec ubuntu-dpdk bash -c "/root/dpdk/usertools/dpdk-hugepages.py -p 2048K --setup 2M --node 0"
#docker exec ubuntu-dpdk bash -c "cat /proc/meminfo | grep HugePages"
#docker exec ubuntu-dpdk bash -c "/root/dpdk/build/examples/dpdk-helloworld -l 0-1 -n 1"
