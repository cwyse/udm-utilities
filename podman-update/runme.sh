#!/bin/bash

#
# This script compiles podman, runc, and conman for aarch64.
#
# The versions may be updated as new releases are produced.  The relevant repositories are:
#   https://github.com/containers/podman
#   https://github.com/opencontainers/runc
#   https://github/containers/conmon
# Versions must match the repository tags exactly.
#
# After building and checking in the new versions.  Push the changes to github so that
# the binaries can be downloaded directly from there via the 01-podman-update.sh script
# on the UDM.
#
cd build
docker build --build-arg PODMAN_VERSION=v3.4.2 --build-arg RUNC_VERSION=v1.0.2 --build-arg CONMON_VERSION=v2.0.30 -t cwyse/podman-update .

docker run --rm -it -v /home/chris/repositories:/home/chris/repositories cwyse/podman-update /bin/bash -c "/bin/cp /tmp/release/* /home/chris/repositories/vendor/udm-utilities/podman-update/bin"
