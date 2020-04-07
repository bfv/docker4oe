# reference the tag og the PAS install image here
FROM pas-dev-install-12.2

LABEL maintainer="Bronco Oostermeyer <dev@bfv.io>"

USER root

ENV INSTANCENAME as-pas
ENV HTTPPORT 10000
ENV HTTPSPORT 10001
ENV PASBASE /app/pas/as

EXPOSE ${HTTPPOST} ${HTTPSPORT}

RUN pasman create -p ${HTTPPORT} -P ${HTTPSPORT} -v -N ${INSTANCENAME} ${PASBASE}

# disable obsolete SOAP & REST protocols
RUN \
  ${PASBASE}/bin/oeprop.sh ${INSTANCENAME}.ROOT.SOAP.adapterEnabled=0 \
  ${PASBASE}/bin/oeprop.sh ${INSTANCENAME}.ROOT.REST.adapterEnabled=0

RUN \
  mkdir /app/pas/as/io && \
  chown -R openedge:openedge /app/pas/as

USER openedge

# the io directory is for exchanging data, logs are, well, for PAS log files
VOLUME /app/pas/as/io
VOLUME /app/pas/as/logs

# we now have a PASOE instance called as-pas (or whatever INSTANCENAME is set to) which has a ROOT application
