# OE 11.7 database (latest)
Since it is considered a best practise to run just one process per container there's no point in installing more than one product.
This `Dockerfile` installs the Enterprise DB Advanced version. I assume that when you enter a Work Group license this will work as well, but know what it is with assumptions. Obviously you have to fill in the license details yourself, in the `oe-11.7.2-lnx-x64-db.response.ini`. 


## building
For building the docker image you need to copy `PROGRESS_OE_11.7.2_LNX_64.tar.gz` to the same directory as the Dockerfile.

```
docker build --rm=true --squash -t oe-11.7.2-db .
```

## start the container

Starting the container can be done with:

```
docker run \
  -dit \
  -v C:/docker/oe-11.7-db-latest/license:/app/license \
  -v C:/docker/oe-11.7-db-latest/db:/app/db \
  oe-11.7.2-db \
  bash
```  

the -v parameter maps the `/app/license` in the container to `C:/docker/oe-11.7-db-latest/license` on the host. Same for `/app/db`.
