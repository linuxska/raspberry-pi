#!/bin/bash

if [ ! `id -u` = 0 ]; then 
 echo "ERROR: This script must be run as the root user"
fi

apt-get --yes install puppet git
git clone https://github.com/rchrd/raspberry-pi.git
