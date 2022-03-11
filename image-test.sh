#!/bin/bash

podman run -ti --rm --name runner --hostname runner hub.thezengarden.net/test-ee:1.0.`date +%m%d` /bin/bash
