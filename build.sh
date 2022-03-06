#!/bin/bash

# BUILD & PUSH
##############
ansible-builder create -f test-environment.yml
podman build -f context/Containerfile -t test-ee
podman tag localhost/test-ee:latest conjur.thezengarden.net/test-ee:1.0.`date +%m%d`
podman push conjur.thezengarden.net/test-ee:1.0.`date +%m%d`


# CLEANUP
#########
podman image prune -f
rm -rf context
