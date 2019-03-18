# docker4oe
Dockerfiles for setting up OpenEdge on Docker.
note: I decided to re-organise this repo and focus more on PAS. For 11.6 and non-PAS stuff separated branches have been created.

## structure
First of all there's the `oe-11.7-pas-latest` directory which contains the installion of PAS in a base image.
In `pas-application` there are a few steps to create an load-balanced application from the base image.

# IMPORTANT
When editting the response.ini and all other files that will be transfered into an image, make sure that these files are saved with LF line endings (as opposed to CR+LF).
