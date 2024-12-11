#!/bin/bash
#
## Reference: https://github.com/nanderoo/ubuntu-mrefd-install/
#

cd # Make sure we at home

# Now for our list of dependencies.. 
sudo apt install \
 cmake \
 cmake-data \
 cython3 \
 build-essential \
 g++ \
 git \
 libargon2-dev \
 libasio-dev \
 libcppunit-dev \
 libcurl4-gnutls-dev \
 libfmt-dev \
 libgnutls28-dev \
 libhttp-parser-dev \
 libjsoncpp-dev \
 libmsgpack-dev \
 libncurses5-dev \
 libreadline-dev \
 libssl-dev \
 nettle-dev \
 pkg-config \
 python3-dev \
 python3-setuptools \
 -y

cd # Back to home

# Setup 'restino'
mkdir restinio
cd restinio
wget https://github.com/aberaud/restinio/archive/2224ffedef52cb2b74645d63d871d61dbd0f165e.tar.gz
ls -l
tar -xzf 2224ffedef52cb2b74645d63d871d61dbd0f165e.tar.gz
cd restinio-2224ffedef52cb2b74645d63d871d61dbd0f165e/dev
cmake -DCMAKE_INSTALL_PREFIX=/usr -DRESTINIO_TEST=OFF -DRESTINIO_SAMPLE=OFF -DRESTINIO_INSTALL_SAMPLES=OFF -DRESTINIO_BENCH=OFF -DRESTINIO_INSTALL_BENCHES=OFF -DRESTINIO_FIND_DEPS=ON -DRESTINIO_ALLOW_SOBJECTIZER=Off -DRESTINIO_USE_BOOST_ASIO=none .
make -j8
sudo make install
cd ../../
rm -rf restinio

cd # Back to home

# Setup 'opendht'
git clone https://github.com/savoirfairelinux/opendht.git
cd opendht
mkdir build && cd build
cmake -DOPENDHT_PYTHON=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
make
sudo make install

cd # Back to home

# Setup 'mrefd'
git clone https://github.com/n7tae/mrefd.git
cd mrefd
cp config/mrefd.blacklist .
cp config/mrefd.whitelist .
cp config/mrefd.interlink .
cp example.mk mrefd.mk
cp example.cfg mrefd.cfg
make
sudo make install

cd # Back to home

# Setup ham-dht-tools
git clone https://github.com/n7tae/ham-dht-tools.git
cd ham-dht-tools
make

cd # Back to home

# Setup 'gomrefdash'
git clone https://github.com/kc1awv/gomrefdash.git
cd gomrefdash
make
cp gomrefdash.sample.toml gomrefdash.toml # then edit as needed...
#./gomrefdash # @TODO: Must be manually run for now, need to figure out a systemd-ish way to auto-start on boot, etc..

