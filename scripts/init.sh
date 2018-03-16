#!/bin/sh -ex

##
## Setup script for chroot.
## It runs only once during chroot tarball creation.
##

# Upgrade software to latest versions, removing all unused packages
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get --purge --auto-remove -y -o 'Dpkg::Options::=--force-confnew' dist-upgrade
