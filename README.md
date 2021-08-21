# docker4oe
Dockerfiles for setting up OpenEdge on Docker. In master there will be the stuff for the latest OpenEdge LTS release. See: https://community.progress.com/s/article/Question-about-LTS-releases-and-upcoming-releases
The current LTS release is 12.2.6. The current LTS release is labeled ":latest" as well.

ALthough PAS is the most obvious candidate, the database is back in play since database images (and therefor containera) are very useful in develop and CI/CD environments.

_note: New insights like Multi Stage builds, OpenEdge LTS version, nut different use cases made me decide to start (sort of) clean. I wanted to start all over again (and stored the old master in `master-old` branch). For the "old" (11.6 and non-PAS and others) stuff separated branches have been created._

# structure

## previous structure
First of all there's the `oe-11.7-pas-latest` directory which contains the installion of PAS in a base image.
In `pas-application` there are a few steps to create an load-balanced application from the base image.

# IMPORTANT
When editting the response.ini and all other files that will be transfered into an image, make sure that these files are saved with LF line endings (as opposed to CR+LF).
