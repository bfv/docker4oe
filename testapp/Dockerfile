FROM account/reponame:oe116base

MAINTAINER Bronco Oostermeyer (dev@bfv.io)

ENV DLC=/usr/dlc
ENV WRKDIR=/usr/wrk
ENV PATH=$DLC:$DLC/bin:$PATH
ENV PROCFG=/license/progress.cfg

# app ports for AppServer http=15555 https=15556
EXPOSE 15555 15556 

run mkdir /opt/testapp

# the following steps take forever, see OpenEdge KB 000064163
run /usr/dlc/servers/pasoe/bin/tcman.sh create -p 15555 -P 15556 -N as-testapp /opt/testapp/as 
run /opt/testapp/as/bin/tcman.sh deploy -a app1 $DLC/servers/pasoe/extras/oeabl.war
run /opt/testapp/as/bin/tcman.sh deploy $DLC/servers/pasoe/extras/oemanager.war
run /opt/testapp/as/bin/tcman.sh deploy $DLC/servers/pasoe/extras/manager.war

# this is not the normal to deploy your software, for for a ping this will do
COPY ping.p /opt/testapp/as/openedge

