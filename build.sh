#!/bin/bash

ansible-builder create -f test-environment.yml
podman build -f context/Containerfile -t test-ee
podman tag localhost/test-ee:latest conjur.thezengarden.net/test-ee:`date +%y%m`
podman push conjur.thezengarden.net/test-ee:`date +%y%m`
