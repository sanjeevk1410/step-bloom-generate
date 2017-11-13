#!/bin/bash

set -e

apt install devscripts fakeroot python-bloom

NOW=`date +'%Y%m%d-%H%M%S'`
bloom-generate rosdebian \
               --os-name ${WERCKER_BLOOM_GENERATE_OS_NAME} \
               --os-version ${WERCKER_BLOOM_GENERATE_OS_VERSION} \
               --ros-distro ${WERCKER_BLOOM_GENERATE_ROS_DISTRO} \
               --native
sed -i -e "1 s/)/-${NOW})/" debian/changelog
fakeroot debian/rules binary
