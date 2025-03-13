# get base image
# for rocky linux
FROM rockylinux:8.9
# for RHEL
#FROM redhat/ubi8:latest

# set the maintainer label
LABEL maintainer="shanakaprageeth"

# set the image name and version
LABEL name="rhel8-dpdk"
LABEL version="1.1"

# Setup RHEL subscription-manager
#RUN subscription-manager register --username USERNAME --password PASSWORD
#RUN subscription-manager attach --auto

# Install DPDK support packages.
RUN dnf --quiet update -y
RUN dnf --quiet install -y libhugetlbfs libpcap kernel kernel-devel kernel-headers git sudo pciutils net-tools iputils
RUN dnf --quiet groupinstall "Development tools" -y
RUN dnf --quiet install python3-pip numactl-devel -y
RUN pip3 install pyelftools
# Clone DPDK-dev to the container
RUN cd && git clone git://dpdk.org/dpdk

RUN pip3 install meson ninja
RUN cd ~/dpdk && \
    meson setup build -Dplatform=generic -Dexamples=helloworld
RUN cd ~/dpdk/build && \
    ninja
RUN cd ~/dpdk/build && \
    meson install && \
    ldconfig
# copy updated main docker build script to repo.
WORKDIR /root

