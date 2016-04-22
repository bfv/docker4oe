### Basic install for OpenEdge 11.6 on Linux ###

## setup ##
Copy the Dockerfile to a directory, place the OpenEdge install .tar.gz and response.ini in the same directory. Added a sample response.ini (obviously the serials etc are stripped), add you own serials.

## Build ##
`docker build -t account/reponame:oe116base .`

## Run ##
`docker run -i -t account/reponame:oe116base bash`


You're now in the Docker container, try `pro`

