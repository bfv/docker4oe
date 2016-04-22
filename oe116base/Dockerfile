FROM centos

MAINTAINER  Bronco Oostermeyer (dev@bfv.io)

# with an update you run the risk that your containers will not be the same every time 
#RUN yum -y update
RUN yum install -y net-tools
RUN yum install -y wget

# install java, see: https://www.digitalocean.com/community/tutorials/how-to-install-java-on-centos-and-fedora

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
RUN yum localinstall -y jdk-8u60-linux-x64.rpm
RUN rm jdk-8u60-linux-x64.rpm

RUN mkdir /install
RUN mkdir /install/openedge

# the install has to be in the same directory as this Dockerfile
COPY PROGRESS_OE_11.6_LNX_64.tar.gz /install
RUN tar -xzvf /install/PROGRESS_OE_11.6_LNX_64.tar.gz -C /install/openedge
RUN rm /install/PROGRESS_OE_11.6_LNX_64.tar.gz

# you need a response.ini from a previous install
COPY response.ini /install/openedge
ENV TERM xterm

RUN /install/openedge/proinst -b /install/openedge/response.ini -l /install/install_oe.log -n

ENV DLC=/usr/dlc
ENV WRKDIR=/usr/wrk
ENV PATH=$DLC:$DLC/bin:$PATH

# cleanup install files
RUN rm -rf /install

# there's an issue with adminserver being slow, see OE KB issue 000064163 
# install rng-tools is the first step in solving.
# as a consequense it is veeerrry slow to create a PASOE instance
RUN yum -y install rng-tools
CMD ["rngd", "-f", "-r", "/dev/hwrng", "-o", "/dev/random"]

