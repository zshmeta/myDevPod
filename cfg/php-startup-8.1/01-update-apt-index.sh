#!/bin/bash
#
# Simple example showing how to update the packet index
#

DEBIAN_FRONTEND=noninteractive apt-get update -q
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q
