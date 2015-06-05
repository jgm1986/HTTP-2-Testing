#!/bin/bash
set -e
mkdir -p packages
cd packages

echo "********************************************************"
echo "* Installing general dependences...                    *"
echo "********************************************************"
sudo apt-get install 	git 			\
			gcc			\
			g++			\
			make			\
			pkg-config 		\
			binutils		\
			autoconf		\
			automake		\
			autotools-dev		\
			libtool 		\
			-y

echo "********************************************************"
echo "* OPENSSL: 1.0.2                                       *"
echo "********************************************************"
sudo apt-get install 	perl			\
			-y
wget https://www.openssl.org/source/openssl-1.0.2a.tar.gz
tar xfv openssl-1.0.2a.tar.gz
cd openssl-1.0.2a
./config
make depend
make
make test
sudo make install
cd ..

echo "******************************************************"
echo "* SPDYLAY: Last Git master version                   *"
echo "******************************************************"
sudo apt-get install 	zlib-bin		\
			libcunit1-dev		\
			libxml2-dev		\
			libevent-dev		\
			zlib1g-dev		\
			libssl-dev		\
			libevent-openssl-2.0-5	\
			-y
git clone https://github.com/tatsuhiro-t/spdylay.git
cd spdylay
autoreconf -i
automake
autoconf
./configure
make
sudo make install
cd ..

echo "********************************************************"
echo "* NGHTTP2: 1.0.1                                       *"
echo "********************************************************"
sudo apt-get install 	gcc			\
			sphinx3			\
			libev-dev		\
			libjansson-dev		\
			libjemalloc-dev		\
			libboost-dev		\
			libboost-thread-dev	\
			cython			\
			python3.4-dev		\
			-y
wget https://github.com/tatsuhiro-t/nghttp2/releases/download/v1.0.1/nghttp2-1.0.1.tar.gz
tar xfv nghttp2-1.0.1.tar.gz
cd nghttp2-1.0.1/
autoreconf -i
automake
autoconf
./configure --enable-asio-lib
make
sudo make install
sudo cp ./lib/.libs/libnghttp2.so.14 /lib
cd ..

cd ..

exit 0
