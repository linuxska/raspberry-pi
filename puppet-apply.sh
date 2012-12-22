#!/bin/bash

if [ ! `id -u` = 0 ]; then 
 echo "ERROR: This script must be run as the root user"
fi

puppet apply --modulepath=./modules ./manifests/pi.pp
