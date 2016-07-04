#!/bin/bash
#
# PLEASE RUN AS ROOT!

cd $(dirname "$0")
BD=$(pwd)
echo "${BD}"
sleep 5
make svn centos arm
cd /usr/
tar xf ${BD}/dist/fpc-3.1.1.x86_64-linux.tar.bz2 
tar xf ${BD}/dist/arm-linux-fpc.x86_64-linux.tar.bz2
tar xf ${BD}/dist/fpc.source.tar.bz2
cd bin/
ln -sf ../lib/fpc/3.1.1/ppcrossarm ppcrossarm
ln -sf ../lib/fpc/3.1.1/ppcx64 ppcx64
cd ..
lib/fpc/3.1.1/samplecfg 
lib/fpc/3.1.1/samplecfg /usr/lib/fpc/3.1.1/ /etc

