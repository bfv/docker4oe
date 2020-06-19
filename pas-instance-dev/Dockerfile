FROM pas-dev-install-12.2

LABEL maintainer="Bronco Oostermeyer <dev@bfv.io>"

USER root

ENV INSTANCENAME as-pas
ENV HTTPPORT 8810
ENV HTTPSPORT 8811
ENV HEALTHPORT 8899
ENV PASBASE /app/pas/as

EXPOSE ${HTTPPOST} ${HTTPSPORT} ${HEALTHPORT}

RUN pasman create -p ${HTTPPORT} -P ${HTTPSPORT} -v -N ${INSTANCENAME} ${PASBASE}

RUN ${PASBASE}/bin/tcman.sh feature HealthCheck=on
RUN ${PASBASE}/bin/tcman.sh config psc.as.health.enabled=true

# disable obsolete SOAP & REST protocols
RUN \
  ${PASBASE}/bin/oeprop.sh ${INSTANCENAME}.ROOT.SOAP.adapterEnabled=0 \
  ${PASBASE}/bin/oeprop.sh ${INSTANCENAME}.ROOT.REST.adapterEnabled=0

RUN \
  mkdir /app/pas/as/io && \
  chown -R openedge:openedge /app/pas/as

USER openedge

COPY start.sh /app/pas

# the io directory is for exchanging data, logs are, well, for PAS log files
VOLUME /app/pas/as/io
VOLUME /app/pas/as/logs

# we now have a PASOE instance called as-pas (or whatever INSTANCENAME is set to) which has a ROOT application
