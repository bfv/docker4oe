# version 2; removed java, combined RUN's
FROM centos

MAINTAINER  Bronco Oostermeyer (dev@bfv.io)

# with an update you run the risk that your containers will not be the same every time 
#RUN yum -y update

# there's an issue with adminserver being slow, see OE KB issue 000064163 
# install rng-tools is the first step in solving.
# as a consequense it is veeerrry slow to create a PASOE instance

RUN yum install -y net-tools && \
  yum -y install rng-tools && \
  mkdir /install && \
  mkdir /install/openedge

# the install has to be in the same directory as this Dockerfile
ADD PROGRESS_OE_11.6_LNX_64.tar.gz /install/openedge

# you need a response.ini from a previous install
COPY response.ini /install/openedge
ENV TERM xterm

RUN /install/openedge/proinst -b /install/openedge/response.ini -l /install/install_oe.log -n 

# got some issues with combining this RUN with the previous so I split them. 
RUN rm -rf /install
  
ENV DLC=/usr/dlc 
ENV WRKDIR=/usr/wrk
ENV PATH=$DLC:$DLC/bin:$PATH

# see above on rngd
CMD ["rngd", "-f", "-r", "/dev/hwrng", "-o", "/dev/random"]
