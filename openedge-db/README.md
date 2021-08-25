# openedge-db
This Dockerfile and script build an installation for running a database.
The reponse.ini installs the "4GL Development System" as well. If not necessary it can be easily left out. 

## volumes
This image exposes the following volumes:
- `/app/db` - database file location
- `/app/license` - location where progress.cfg must reside

If you don't map /app/db te database will be "embedded", read: destroyed on the container is stopped.
This can be handy for CI/CD purposes.

## ports
No ports are defined at this stage.

_tip: use `ln -s <oe-installer-fullpathname>:<dockerdir/installer-name>` to avoid a lot of copies of PROGRESS_OE_${version}_LNX_64.tar.gz_
