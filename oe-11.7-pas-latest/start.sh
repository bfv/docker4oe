#!/bin/bash

logfile=/app/pas/as/logs/as-pas.agent.log
touch $logfile

/app/pas/as/bin/tcman.sh start -v

tail -f $logfile
