FROM adoptopenjdk/openjdk11:jdk-11.0.6_10-alpine

LABEL maintainer="Bronco Oostermeyer <dev@bfv.io>"

ADD PROGRESS_OE_12.2_LNX_64.tar.gz /install/openedge

COPY response.ini /install/openedge/response.ini
ENV TERM xterm

RUN /install/openedge/proinst -b /install/openedge/response.ini -l /install/install_oe.log -n && \
  rm -rf /install/openedge && \
  rm -f /usr/dlc/progress.cfg

RUN addgroup -g 1000 -S openedge && \
    adduser -S openedge -G openedge  

ENV DLC=/usr/dlc
ENV WRKDIR=/usr/wrk
ENV PATH=$DLC:$DLC/bin:$PATH

# create directories and files as root
RUN \
  mkdir /app/ && \
  mkdir /app/pas/ && \
  mkdir /app/license/

# turn them over to user pasadmin
RUN chown -R openedge:openedge /app/
RUN chmod +x /app/pas/start.sh

ENV PROCFG=/app/license/progress.cfg

USER openedge

VOLUME /app/license
