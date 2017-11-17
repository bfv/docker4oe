FROM centos

LABEL maintainer="Bronco Oostermeyer (dev@bfv.io)"

# with an update you run the risk that your containers will not be the same every time 
#RUN yum -y update

# there's an issue with adminserver being slow, see OE KB issue 000064163 
# install rng-tools is the first step in solving.
# as a consequense it is veeerrry slow to create a PASOE instance

RUN \
  yum install -y net-tools && \
  yum install -y rng-tools && \
  mkdir /install && \
  mkdir /install/openedge

  # see above on rngd
CMD ["rngd", "-f", "-r", "/dev/hwrng", "-o", "/dev/random"]

# the install has to be in the same directory as this Dockerfile
ADD PROGRESS_OE_11.7.2_LNX_64.tar.gz /install/openedge

# you need a response.ini from a previous install
COPY oe-11.7.2-lnx-x64-db.response.ini /install/openedge/response.ini
ENV TERM xterm

RUN /install/openedge/proinst -b /install/openedge/response.ini -l /install/install_oe.log -n && \
  rm -rf /install/openedge && \
  rm -f /usr/dlc/progress.cfg
  
ENV DLC=/usr/dlc 
ENV WRKDIR=/usr/wrk
ENV PATH=$DLC:$DLC/bin:$PATH

RUN \
  mkdir /app && \
  mkdir /app/db && \
  mkdir /app/license

ENV PROCFG=/app/license/progress.cfg

VOLUME /app/db /app/license
