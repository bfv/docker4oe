# OE 11.7 development (latest)
This `Dockerfile` installs all products for development. Obviously you have to fill in the license details yourself, in the `oe-11.7.2-lnx-x64-dev.response.ini`. 


## building
For building the docker image you need to copy `PROGRESS_OE_11.7.2_LNX_64.tar.gz` to the same directory as the Dockerfile.

```
docker build --rm=true --squash -t oe-11.7.2-dev .
```

## start the container

Starting the container can be done with:

```
docker run \
  -it \
  -v C:/docker/oe-11.7-dev-latest/license:/app/license \
  oe-11.7.2-dev \
  /bin/bash
```  

the -v parameter maps the `/app/license` in the container to `C:/docker/oe-11.7-dev-latest/license` on the host.
