
FROM account/reponame:oe116base

MAINTAINER Bronco Oostermeyer (dev@bfv.io)

RUN mkdir /install
RUN mkdir /install/openedge

COPY PROGRESS_OE_11.6.1_LNX_64.tar.gz /install
RUN tar -xzvf /install/PROGRESS_OE_11.6.1_LNX_64.tar.gz -C /install/openedge
RUN rm /install/PROGRESS_OE_11.6.1_LNX_64.tar.gz

COPY response.ini /install/openedge
ENV TERM xterm

RUN /install/openedge/proinst -b /install/openedge/response.ini -l /install/install_oe-11.6.1.log -n

RUN rm -rf /install

