# Setup a PAS container
The installation is described in oe-11.7-pas-latest directory in the repo.
In this section an instance is created and setup in two different steps to make it all re-usable.

# pas-instance
Creates an empty instance of pas in an (docker) image. This empty conatiner will need to be configured to turn it into an actual application. See pas-httpbin.

# pas-httpbin
Here is the actual application build. It uses a pas-instance and a sample .pl is added to the image to actually provide functionality.
It uses bfvlib.pl which sources you can find at: https://github.com/bfv/bfvlib

# runtime
In the run.cmd file is the following:
```
docker run ^
  -d ^
  -v C:/docker/licenses/oe-11.7:/app/license ^
  -p 10000:10000 ^
  pas-httpbin
```
Obviously you have to provide you own progress.cfg and put this in whatever you specified as mapping for `app/license` (see the line starting with `-v`).

Once the container is running you'll be able to requets http://localhost:10000/web/get?openedge=true&testparam=made_by_bfv
