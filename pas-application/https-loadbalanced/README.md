# PAS load balanced behind Apache secure httpd server

Once you start running PAS instance in docker you'll probably realize this gives some opportunity for load balancing them. This could for example be usefull for stopping ill behaving instances without the service being unavailable.

## prerequisites
For this to work you need the following:
- a bash shell should available (check "Git for Windows")
- a (sub) domain which you own
- the pas-httpbin:latest image (see elsewhere in the repo)

## TLS
For secure operations we need a certificate. Nowadays Letsencrypt certificates are freely available. This comes however at the prices of some added complexity. This setup tries to remove some of that complexity.
In this setup all the https/TLS stuff is moved to the httpd container in the process assuming that https between the components is not a requirement. For extra security reasons a separate docker network could be setup.

The setup will look like:

```
┌───────────┐          ┌───────────┐
│   httpd   │ ──────┬──│    pas1   │
└─────┬─────┘       │  └───────────┘
      ┊             │  ┌───────────┐
      ┊             ├──│    pas2   │
┌─────┴─────┐       │  └───────────┘
│  certbot  │       │  ┌───────────┐
└───────────┘       └──│    pas3   │
                       └───────────┘

```

In this picture every box represents a Docker container.

## Docker compose
Since we're orchestrating multiple container we use `Docker Compose` to tie them all together.

## flow
First we need to replace all the ${mydomain} placeholders with you actual domain. Next we setup Apache and Certbot. Certbot is the letsencrypt container to make obtaining a certificate easy.
run `init-letsencrypt.sh`. What this does is creating a temp certificate to make sure that Apache will be able to start (with SSL settings enabled). After that the certbot requests the certificates.

## load balancing three PAS instances
The `data/apache/pas/pas.conf` file reflect what is necessary to devide the load over 3 PAS instances and do a healthcheck every 5 seconds.

## disclaimer
Everything has been developed and tested on Windows 10 (1809 build).

### credits
From a knowledge point of view this article borrows heavily from: https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71 from Philip (last name unknown).
