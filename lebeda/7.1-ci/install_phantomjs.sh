#!/usr/bin/env bash

PHANTOM_VERSION="phantomjs-1.9.8"
ARCH=$(uname -m)

if ! [ $ARCH = "x86_64" ]; then
	$ARCH="i686"
fi

PHANTOM_JS="$PHANTOM_VERSION-linux-$ARCH"


apt-get install -y wget bzip2 build-essential chrpath libssl-dev libxft-dev \
 libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

cd ~
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
tar xvjf $PHANTOM_JS.tar.bz2

mv $PHANTOM_JS /usr/local/share
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
