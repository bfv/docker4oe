#!/bin/sh

# if you choose another instance name in the Dockerfile, make sure to 
# change the log file name accordingly
logfile=/app/pas/as/logs/as-pas.agent.log
touch $logfile

/app/pas/as/bin/tcman.sh start -v

tail -f $logfile
