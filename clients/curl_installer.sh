#!/bin/bash
set -e
mkdir -p packages
cd packages

echo "********************************************************"
echo "* cURL: DEV                                            *"
echo "********************************************************"
sudo apt-get install    m4                      \
                        groff                   \
                        libssh2-1-dev           \
                        -y
git clone https://github.com/bagder/curl.git
cd curl
./buildconf
./configure
make
sudo make install
cd ..

cd ..

exit 0
