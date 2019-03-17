FROM oe-11.7.4-pas-instance
LABEL maintainer="Bronco Oostermeyer (dev@bfv.io)"

ADD bfvlib.pl ${PASBASE}/openedge/

# set the PROPATH
RUN ${PASBASE}/bin/oeprop.sh +AppServer.Agent.${INSTANCENAME}.PROPATH="${PASBASE}/openedge,${PASBASE}/openedge/bfvlib.pl,${DLC}/tty,${DLC}/tty/netlib/OpenEdge.Net.pl"
RUN ${PASBASE}/bin/oeprop.sh +${INSTANCENAME}.ROOT.WEB.handler1=bfvlib.pas.WebHandlerExt:/

CMD [ "/app/pas/start.sh" ]
