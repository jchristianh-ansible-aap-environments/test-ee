#!/bin/bash

BUILD_VER="1.0"
BUILD_IMG="test-ee"

EE_FILE="test-environment.yml"
CF_FILE="context/Containerfile"

BUILD_TAG="latest"
EE_TAG="${BUILD_VER}.`date +%m%d`"

PUSH_REMOTE="conjur.thezengarden.net"


# CREATE BUILD CONTEXT
######################
ansible-builder create -f ${EE_FILE}


# COPY SAMPLE FILE INTO CONTEXT
###############################
cp -av foo.txt context/


# BUILD EE IMAGE
################
podman build -f ${CF_FILE} -t ${BUILD_IMG}:${BUILD_TAG}


# TAG & PUSH EE IMAGE
#####################
podman tag localhost/${BUILD_IMG}:${BUILD_TAG} ${PUSH_REMOTE}/${BUILD_IMG}:${EE_TAG}
podman push ${PUSH_REMOTE}/${BUILD_IMG}:${EE_TAG}


# CLEANUP
#########
podman image prune -f
rm -rf context
