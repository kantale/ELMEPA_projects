# Install R from a container that contains only:
# FROM ubuntu:16.04

apt-get update
apt-get install -y build-essential gfortran wget 


OBC_TOOL_PATH=/root  # This is the root where all tools will be installed

# INSTALL openssl-1.1.1g


INSTALL_DIR=${OBC_TOOL_PATH}/openssl-1.1.1g
BUILD_DIR=${INSTALL_DIR}/build
TARFILE=${INSTALL_DIR}/openssl-1.1.1g.tar.gz
SRC_DIR=${INSTALL_DIR}/openssl-1.1.1g



${BUILD_DIR}/bin/openssl help || (mkdir ${INSTALL_DIR} ${BUILD_DIR} && \
	wget -O ${TARFILE} https://www.openssl.org/source/openssl-1.1.1g.tar.gz && \
	tar zxvf ${TARFILE}  --directory ${INSTALL_DIR} && \
	(cd ${SRC_DIR} && ./config --prefix=${BUILD_DIR} && make && make install))


# INSTALL libssh2-1.9.0

INSTALL_DIR=${OBC_TOOL_PATH}/libssh2-1.9.0
SRC_DIR=${INSTALL_DIR}/libssh2-1.9.0
BUILD_DIR=${INSTALL_DIR}/build
TARFILE=${INSTALL_DIR}/libssh2-1.9.0.tar.gz

AAA=/root/openssl-1.1.1g/build/


(echo "int main(){ return 0;}" > ${INSTALL_DIR}/test.c && gcc -L${BUILD_DIR}/lib/ -lssh2 ${INSTALL_DIR}/test.c) || \
        (
		mkdir -p ${INSTALL_DIR} ${BUILD_DIR} &&
		wget -O ${TARFILE} https://www.libssh2.org/download/libssh2-1.9.0.tar.gz && \
		tar zxvf  ${TARFILE} --directory ${INSTALL_DIR} && \
		(	cd ${SRC_DIR} && \
			./configure --prefix=${BUILD_DIR} --with-crypto=openssl LDFLAGS="-L${AAA}/lib/" CPPFLAGS="-I${AAA}/include/" && \
			make && \
			make install
		)
        )

# INSTALL curl-7.69.1

INSTALL_DIR=${OBC_TOOL_PATH}/curl-7.69.1
SRC_DIR=${INSTALL_DIR}/curl-7.69.1
BUILD_DIR=${INSTALL_DIR}/build
TARFILE=${INSTALL_DIR}/curl-7.69.1.tar.gz

OPENSSL=/root/openssl-1.1.1g/build/
LIBSSH2=/root/libssh2-1.9.0/build/

${BUILD_DIR}/bin/curl --help || (

	mkdir -p ${INSTALL_DIR} ${BUILD_DIR} && \
	wget -O ${TARFILE} https://github.com/curl/curl/releases/download/curl-7_69_1/curl-7.69.1.tar.gz  && \
        tar zxvf ${TARFILE} --directory ${INSTALL_DIR} && \
        (
          cd ${SRC_DIR} && \
          ./configure --prefix=${BUILD_DIR} --with-ssl=${OPENSSL} --with-libssh2 --with-libssh2=${LIBSSH2} && \
          make && \
          make install
	)
)

# INSTALL zlib-1.2.11

INSTALL_PATH=${OBC_TOOL_PATH}/zlib-1.2.11
BUILD_PATH=${INSTALL_PATH}/build
SRC_PATH=${INSTALL_PATH}/zlib-1.2.11
TARFILE=${INSTALL_PATH}/zlib-1.2.11.tar.gz

(echo "int main(){return 0;}" > ${INSTALL_PATH}/test.c && gcc -L${BUILD_PATH}/lib/ -lz ${INSTALL_PATH}/test.c) || \
   (
      mkdir -p ${INSTALL_PATH} ${BUILD_PATH} && \
      wget -O ${TARFILE} https://www.zlib.net/zlib-1.2.11.tar.gz && \
      tar zxvf ${TARFILE} --directory ${INSTALL_PATH} && \
      (
         cd ${SRC_PATH} && \
         ./configure --prefix=${BUILD_PATH} && \
         make && \
         make install
      )
)

# INSTALL bzip2-1.0.8

INSTALL_DIR=${OBC_TOOL_PATH}/bzip2-1.0.8
BUILD_DIR=${INSTALL_DIR}/build
TARFILE=${INSTALL_DIR}/bzip2-1.0.8.tar.gz
SRC_DIR=${INSTALL_DIR}/bzip2-1.0.8


${BUILD_DIR}/bin/bzip2 --help || \
(
   mkdir -p ${INSTALL_DIR} ${BUILD_DIR} && \
   wget -O ${TARFILE}  https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz && \
   tar zxvf ${TARFILE} --directory ${INSTALL_DIR} && \
   (
     cd ${SRC_DIR} && \
     make install PREFIX=${BUILD_DIR}
   )
)

# INSTALL xz-5.2.5  libzma

INSTALL_DIR=${OBC_TOOL_PATH}/xz-5.2.5
BUILD_DIR=${INSTALL_DIR}/build
SRC_DIR=${INSTALL_DIR}/xz-5.2.5
TARFILE=${INSTALL_DIR}/xz-5.2.5.tar.gz

${BUILD_DIR}/bin/xz --help || \
(
   mkdir -p ${INSTALL_DIR} ${BUILD_DIR} && \
   wget -O ${TARFILE} https://tukaani.org/xz/xz-5.2.5.tar.gz && \
   tar zxvf ${TARFILE} --directory ${INSTALL_DIR} && \
   (
      cd ${SRC_DIR} && \
      ./configure --prefix=${BUILD_DIR} && \
      make && \
      make install
   )
)  


# INSTALL pcre2-10.35

INSTALL_PATH=${OBC_TOOL_PATH}/pcre2-10.35
BUILD_PATH=${INSTALL_PATH}/build
TARFILE=${INSTALL_PATH}/pcre2.tar.gz
SRC_PATH=${INSTALL_PATH}/pcre2-10.35

${BUILD_PATH}/bin/pcre2test --help || \
(
   mkdir -p ${INSTALL_PATH} ${BUILD_PATH} && \
   wget -O ${TARFILE}  https://ftp.pcre.org/pub/pcre/pcre2-10.35.tar.gz && \
   tar zxvf ${TARFILE} --directory ${INSTALL_PATH} && \
   (
       cd ${SRC_PATH} && \
       ./configure --prefix=${BUILD_PATH} && \
       make && \
       make install
   )
)

# Install R-4.0.0

INSTALL_DIR=${OBC_TOOL_PATH}/R-4.0.0
BUILD_DIR=${INSTALL_DIR}/build
SRC_DIR=${INSTALL_DIR}/R-4.0.0
TARFILE=${INSTALL_DIR}/R-4.0.0.tar.gz

ZLIB_BUILD=/root/zlib-1.2.11/build/
BZIP2_BUILD=/root/bzip2-1.0.8/build/
LIBLZMA_BUILD=/root/xz-5.2.5/build/
LIBCURL_BUILD=/root/curl-7.69.1/build/
PCRE2_BUILD=/root/pcre2-10.35/build/

export PATH=${PATH}:${PCRE2_BUILD}/bin

${BUILD_DIR}/bin/R --version || \
(
   mkdir -p ${INSTALL_DIR} ${BUILD_DIR} &&
   (
      (md5sum ${TARFILE} | grep "48c487c68112cb3191f3015c6277a50b") || \
      (
        wget -O ${TARFILE} https://cran.r-project.org/src/base/R-4/R-4.0.0.tar.gz && \
        (md5sum ${TARFILE} | grep "48c487c68112cb3191f3015c6277a50b")
      )
   ) && \
   tar zxvf ${TARFILE} --directory ${INSTALL_DIR} && \
   (
      cd ${SRC_DIR} && 
      ./configure \
         --prefix=${BUILD_DIR} \
         --with-readline=no \
         --with-x=no \
         LDFLAGS="-L${ZLIB_BUILD}/lib -L${BZIP2_BUILD}/lib -L${LIBLZMA_BUILD}/lib -L${LIBCURL_BUILD}/lib -L${PCRE2_BUILD}/lib " \
         CPPFLAGS="-I${ZLIB_BUILD}/include -I${BZIP2_BUILD}/include -I${LIBLZMA_BUILD}/include -I${LIBCURL_BUILD}/include -I${PCRE2_BUILD}/include " \
         LIBS="-lcurl" && \
       make && \
       make install 
   )
  
)





