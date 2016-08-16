#! /bin/bash
# Requires the fpm gem

VER="2.3.1"
ITERATOR=4
PKG_NAME="di-ruby"

apt-get update
apt-get install -y gcc make ruby1.9.1 ruby1.9.1-dev wget zlib1g-dev libssl-dev
gem install fpm

wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-$VER.tar.gz
mkdir stg
tar zxvf ruby-$VER.tar.gz

cd ruby-$VER
./configure --prefix=/usr
make
make DESTDIR=../stg install

cd ../stg

fpm --package . -s dir -t deb \
--name "${PKG_NAME}" \
--version $VER \
--iteration $ITERATOR \
--license "2-clause BSDL" \
--description "Ruby $VER Interpreter." \
--vendor "Ruby" \
--url "https://www.ruby-lang.org/en/documentation/" \
--maintainer "jeff.laplante@disney.com" \
--prefix "/" \
--workdir /tmp \
usr

PKG="${PKG_NAME}_${VER}-${ITERATOR}_amd64.deb"
echo "Checking integrity of package: $PKG"
dpkg -I $PKG
dpkg -c $PKG > /dev/null
mv *.deb ..
