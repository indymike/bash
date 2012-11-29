#!/bin/bash

# clean-kernel-images.sh
# ----------------------
# removes old kernel images from /boot 
# 
# does so by creating a list of kernel images in /tmp/oldimages and 
# then calling apt-get purge for each. Use this two ways:
#
# Get rid of all but the current Kernel:
# 
# $ sudo cleankernelimages
#
# Create a list of kernels, review and then remove.
#
# $ sudo createkernellist
#
# edit /tmp/oldimages with your favorite text editor
#
# sudo removeoldkernels
#

function createkernellist()
{
    dpkg -l ‘linux-*’ | sed ‘/^ii/!d;/’”$(uname -r | sed “s/\(.*\)-\([^0-9]\+\)/\1/”)”‘/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d’ >/tmp/oldimages
}

function removeoldkernels()
{
    cat /tmp/file | xargs sudo apt-get -y purge
}

function cleankernelimages()
{
    cleankernelimages
    removeoldkernels
}