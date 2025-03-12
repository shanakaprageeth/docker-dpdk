# get base ubuntu image
FROM ubuntu:24.04

# set the maintainer label
LABEL maintainer="shanakaprageeth"

# set the image name and version
LABEL name="ubuntu24-dpdk"
LABEL version="1.0"

# set environment variables for noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# update repos and install required packages
RUN apt-get --quiet update -y && \
    apt-get --quiet install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y build-essential git python3 pciutils vim dpdk dpdk-dev libdpdk-dev sudo software-properties-common

RUN add-apt-repository ppa:canonical-kernel-team/ppa && \
    apt update

RUN apt --quiet install python3-pip python3-pyelftools -y
RUN apt-get --quiet update -y && apt-get --quiet install -y libnuma-dev linux-image-generic linux-headers-generic net-tools libssl-dev ninja-build
# if you can find kernel images install the specifc image and headers below
#    apt-get install -y linux-image-$(uname -r) linux-headers-$(uname -r)

RUN cd && git clone git://dpdk.org/dpdk 
RUN apt-get --quiet install -y meson
RUN apt-get --quiet install -y python3-venv
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install meson ninja
RUN cd ~/dpdk && \
    meson setup build --prefix=/opt/ -Dplatform=generic -Dexamples=l2fwd,l3fwd,helloworld
RUN cd ~/dpdk/build && \
    ninja
#RUN cd ~/dpdk/build && \
#    /opt/venv/bin/meson install && \
#    ldconfig 
# copy updated main docker build script to repo.
WORKDIR /root
# old script from 2019 do not use 
#COPY ./dpdk-setup.sh /root/dpdk/tools/
RUN mkdir -p /root/old/
COPY ./dpdk-setup.sh /root/old/
# set the default command to run the container
CMD ["bash"]




