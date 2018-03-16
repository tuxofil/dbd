#!/bin/sh -ex

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get --purge --auto-remove -y -o 'Dpkg::Options::=--force-confnew' dist-upgrade
