#!/bin/bash
# author Shanaka Prageeth
# details about the script

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

check_image_name() {
    if [ -z "$1" ]; then
        echo "Usage: $PROGRAM_NAME <IMAGE_NAME>"
        exit 1
    fi
}

check_root
check_image_name "$1"
IMAGE_NAME="$1"

set -e
echo "Test 1: Huge page allocation"
docker run --rm --privileged  --cap-add=ALL \
          -v /sys/bus/pci/devices:/sys/bus/pci/devices \
          -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
          -v /sys/devices/system/node:/sys/devices/system/node \
          -v /dev:/dev \
          -v /home/$USER:/home/$USER \
          --name docker-dpdk $IMAGE_NAME bash -c "/root/dpdk/usertools/dpdk-hugepages.py -p 2048K --setup 2M --node 0 && cat /proc/meminfo | grep HugePages"

echo "Test 2: DPDK hello-world"
docker run --rm --privileged  --cap-add=ALL \
          -v /sys/bus/pci/devices:/sys/bus/pci/devices \
          -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages \
          -v /sys/devices/system/node:/sys/devices/system/node \
          -v /dev:/dev \
          -v /home/$USER:/home/$USER \
          --name docker-dpdk $IMAGE_NAME bash -c "/root/dpdk/usertools/dpdk-hugepages.py -p 2048K --setup 2M --node 0 && /root/dpdk/examples/dpdk-helloworld -l 0-1 -n 1"
