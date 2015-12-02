#!/bin/bash
set -e
mkdir -p packages
cd packages

echo "******************************************************"
echo "* NGINX: 1.9.5                                       *"
echo "******************************************************"
wget http://nginx.org/download/nginx-1.9.5.tar.gz
tar xfv nginx-1.9.5.tar.gz
cd nginx-1.9.5/
./configure --without-http_rewrite_module --with-http_ssl_module
make
sudo make install
