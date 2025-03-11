# get base image
FROM rockylinux:8.9
#FROM redhat/ubi8:latest

# set the maintainer label
LABEL maintainer="shanakaprageeth"

# set the image name and version
LABEL name="rhel8-dpdk"
LABEL version="1.0"



# Setup subscription-manager / or else set up-yum
#RUN subscription-manager register --username USERNAME --password PASSWORD
#RUN subscription-manager attach --auto

# Install DPDK support packages.
RUN dnf update -y
RUN dnf install -y libhugetlbfs libpcap kernel kernel-devel kernel-headers git pciutils
RUN dnf groupinstall "Development tools" -y
RUN dnf install python3-pip numactl-devel -y
# Clone DPDK-dev to the container
RUN cd && git clone git://dpdk.org/dpdk

RUN pip3 install meson ninja
RUN cd ~/dpdk && \
    meson setup build
#RUN cd ~/dpdk/build && \
#    ninja
#RUN cd ~/dpdk/build && \
#    mason install && \
#    ldconfig 
# copy updated main docker build script to repo.
WORKDIR /root
# old script from 2019 do not use
#COPY ./dpdk-setup.sh /root/dpdk/tools/
RUN mkdir -p /root/old/
COPY ./dpdk-setup.sh /root/old/

