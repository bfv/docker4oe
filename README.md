# docker4oe
Dockerfiles for setting up OpenEdge on Docker

## flattening images ##
The images via the Dockerfiles can become quite large. If you're sure you're satisfied with an image you can flatten the image via:

`docker export <container id> | docker import - account/reponame:oe-11.6-latest-flat`

## Note for Docker on Windows
Make sure that your text files (Dockerfile but especially response.ini) have just a LF as end-of-line. CRLF as EOL can give some timeconsuming surprises  

# IMPORTANT
When editting the response.ini file make sure that the file is saved with LF line endings (as opposed to CR+LF).
