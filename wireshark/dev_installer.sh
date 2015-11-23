#!/usr/bin/env bash
set -e
echo "Warning! This scripts install the develop version of Wireshark on your system."

# Clonning Wireshark repository
git clone  https://code.wireshark.org/review/p/wireshark.git

cd wireshark
./configure
make
sudo make install

