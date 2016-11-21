# get base ubutu image
FROM ubuntu

# run docker image
LABEL RUN docker run -it --name ubuntu-dpdk-build

# update repos and install required packages
RUN apt-get update -y
RUN apt-get install build-essential git python vim -y
RUN apt-get install linux-image-$(uname -r) -y
RUN apt-get install linux-headers-$(uname -r) -y
RUN cd && git clone git://dpdk.org/dpdk 

# copy updated main docker build script to repo.
WORKDIR /root
COPY ./dpdk-setup.sh /root/dpdk/tools/




