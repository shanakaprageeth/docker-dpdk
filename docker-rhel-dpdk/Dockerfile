FROM centos 
#registry.access.redhat.com/rhel7/rhel-tools


# run the container
LABEL RUN docker run -it --name rhel-dpdk-build 

# Setup subscription-manager / or else set up-yum
#RUN subscription-manager register --username USERNAME --password PASSWORD
#RUN subscription-manager attach --auto

# Install DPDK support packages.
RUN yum update -y
RUN yum install -y libhugetlbfs-utils libpcap-devel kernel-$(uname -r) kernel-devel-$(uname -r) kernel-headers-$(uname -r) git pciutils 
RUN yum groupinstall "Development tools" -y

# Clone DPDK-dev to the container
RUN cd && git clone git://dpdk.org/dpdk 

# copy updated main docker build script to repo.
WORKDIR /root
COPY ./dpdk-setup.sh /root/dpdk/tools/

