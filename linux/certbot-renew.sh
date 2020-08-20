#!/bin/bash

# https://certbot.eff.org/docs/install.html#running-with-docker

docker run -it --rm --name certbot \
  -v "/etc/letsencrypt:/etc/letsencrypt" \
  -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
  -p "80:80" \
  -p "443:443" \
  certbot/certbot renew

