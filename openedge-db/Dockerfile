FROM adoptopenjdk/openjdk11:jdk-11.0.8_10-centos AS install

LABEL maintainer="Bronco Oostermeyer <dev@bfv.io>"

RUN yum install sysvinit-tools -y

# if a fixed Dockerfile is need, just replace OE_VERSION with the version string (f.e. 12.2.2)
ADD PROGRESS_OE_${OE_VERSION}_LNX_64.tar.gz /install/openedge

COPY response.ini /install/openedge/response.ini
ENV TERM xterm

RUN /install/openedge/proinst -b /install/openedge/response.ini -l /install/install_oe.log -n
  
# multi stage build, this give the possibilty to remove all the slack from stage 0
FROM adoptopenjdk/openjdk11:jdk-11.0.8_10-centos

RUN yum install sysvinit-tools -y

RUN mkdir /usr/dlc && \
    mkdir /usr/wrk

COPY --from=install /usr/dlc /usr/dlc
COPY --from=install /usr/wrk /usr/wrk

WORKDIR /usr/dlc/bin

RUN chown root _* && \
    chmod 4755 _* && \
    chmod 755 _sql* && \
    chmod 755 _waitfor

ENV TERM xterm
ENV DLC=/usr/dlc
ENV WRKDIR=/usr/wrk
ENV PATH=$DLC:$DLC/bin:$PATH

RUN groupadd -g 1000 openedge && \
    useradd -r -u 1000 -g openedge openedge

# create directories and files as root
RUN \
  mkdir /app/ && \
  mkdir /app/db/ && \
  mkdir /app/license/

# hand them over to user 'openedge'
RUN chown -R openedge:openedge /app/

USER openedge

WORKDIR /app/db

ENV PROCFG=/app/license/progress.cfg

VOLUME /app/license
VOLUME /app/db
