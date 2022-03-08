#!/bin/bash

podman run -ti --rm --name runner --hostname runner conjur.thezengarden.net/test-ee:1.0.`date +%m%d` /bin/bash
