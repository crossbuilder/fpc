#!/bin/bash
#
# PLEASE RUN AS ROOT!

usever="3.3.1"

cd $(dirname "$0")
BD=$(pwd)
echo "${BD}"
sleep 5
make svn centos arm
cd /usr/
tar xf ${BD}/dist/fpc-${usever}.x86_64-linux.tar.bz2 
tar xf ${BD}/dist/arm-linux-fpc.x86_64-linux.tar.bz2
tar xf ${BD}/dist/fpc.source.tar.bz2
cd bin/
ln -sf ../lib/fpc/${usever}/ppcrossarm ppcrossarm
ln -sf ../lib/fpc/${usever}/ppcx64 ppcx64
cd ..
lib/fpc/${usever}/samplecfg 
lib/fpc/${usever}/samplecfg /usr/lib/fpc/${usever}/ /etc
cd ${BD}
cat add-fpc.cfg >> /etc/fpc.cfg

