FBASE:=$(shell pwd )
STABLEFPC=${FBASE}/bootstrap/ppcx64_300
BUILTFPC=${FBASE}/build/fpc/compiler/ppcx64
NEWFPC=${FBASE}/build/ppcx64

FPCSOURCE=${FBASE}/source/fpc-trunk.tar.xz

ARMOPT=-dFPC_ARMHF -Cparmv7a -CfVFPv3 -Oparmv7a 

upclean:
	source/upclean

clean:
	rm -rf "${FBASE}/build/" "${FBASE}/dist/"

prepare: clean
	mkdir "${FBASE}/build/" "${FBASE}/dist/"
	cd "${FBASE}/build/" ; tar xf "${FPCSOURCE}"

svn: clean
	mkdir "${FBASE}/build/" "${FBASE}/dist/"
	cd "${FBASE}/build/" ; svn co http://svn.freepascal.org/svn/fpc/trunk fpc

centos:
	cd "${FBASE}/build/fpc" ; make FPC="${STABLEFPC}" distclean ; make FPC="${STABLEFPC}" all 
	#singlezipinstall zipsourceinstall
	cp "${BUILTFPC}" "${NEWFPC}"
	echo "using ${NEWFPC} for installation" ; sleep 10
	cd "${FBASE}/build/fpc" ; make FPC="${NEWFPC}" singlezipinstall zipsourceinstall
	cp build/fpc/*.gz dist/
	#cd "${FBASE}/build/fpc" ; make FPC="${STABLEFPC}" distclean ; make FPC="${STABLEFPC}" zipsourceinstall 
	#CPU_TARGET=arm OS_TARGET=linux CROSSOPT="${ARMOPT}" BINUTILSPREFIX="arm-linux-gnueabihf-"

arm:
	cd "${FBASE}/build/fpc" ; make FPC="${STABLEFPC}" distclean ; make FPC="${STABLEFPC}" all crosssinglezipinstall CPU_TARGET=arm OS_TARGET=linux CROSSOPT="${ARMOPT}" BINUTILSPREFIX="arm-linux-gnueabihf-"
	cp build/fpc/*.gz dist/
	
	#cd "${FBASE}/build/fpc" ; make FPC="${STABLEFPC}" distclean ; make FPC="${STABLEFPC}" all singlezipinstall CPU_TARGET=arm OS_TARGET=linux CROSSOPT="${ARMOPT}" CROSSBINDIR=/opt/pkg/petalinux-v2016.1-final/tools/linux-i386/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/bin/
	#cp build/fpc/*.gz dist/

sourcezip:

	
