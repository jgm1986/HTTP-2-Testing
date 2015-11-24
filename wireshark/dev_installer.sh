#!/usr/bin/env bash
set -e
echo "Warning! This scripts installs the develop version of Wireshark on your system (last build)."

# Installing dependencies.
sudo apt-get install qt-sdk curl libgtk-3-dev libpcap-dev -y

# Downloading lastest build Wireshark for Linux
URL="https://www.wireshark.org/download/automated/src/"
FILENAME="$(curl $URL | sed -n 's/.*href="\([^"]*\).*/\1/p' | sed '7q;d')"
DOWNLOAD=$URL$FILENAME
wget $DOWNLOAD
tar xfv wireshark*
cd wireshark*

# Build and install Wireshark
./configure
make
sudo make install
echo "Done!"
