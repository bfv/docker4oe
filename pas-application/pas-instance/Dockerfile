FROM oe-11.7.4-pas

LABEL maintainer="Bronco Oostermeyer (dev@bfv.io)"

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

RUN chown -R pasadmin:pasadmin /app/pas/as

USER pasadmin

# we now have a PASOE instance called as-pas (or whatever INSTANCENAME is set to) which has a ROOT application
