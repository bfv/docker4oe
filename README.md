# docker4oe
Dockerfiles for setting up OpenEdge on Docker

## flattening images ##
The images via the Docker can become quite large. If you're sure you're satisfied with an image you can flatten the image via:

`docker export <container id> | docker import - account/reponame:oe-11.6-latest-flat`
