#! /bin/bash
# Requires the fpm gem

cd /tmp
wget https://cache.ruby-lang.org/pub/ruby/ruby-$RUBY_VER.tar.gz
mkdir stg
tar zxvf ruby-$RUBY_VER.tar.gz

cd ruby-$RUBY_VER
./configure --prefix=/usr
make
make DESTDIR=/tmp/stg install

cd /tmp/stg

fpm --package . -s dir -t deb \
--name "${PKG_NAME}" \
--version $RUBY_VER \
--iteration $ITERATOR \
--license "2-clause BSDL" \
--description "Ruby $VER Interpreter." \
--vendor "Ruby" \
--url "https://www.ruby-lang.org/en/documentation/" \
--maintainer "${MAINTAINER}" \
--prefix "/" \
--workdir /tmp \
usr

PKG="${PKG_NAME}_${RUBY_VER}-${ITERATOR}_amd64.deb"
echo "Checking integrity of package: $PKG"
dpkg -I $PKG
dpkg -c $PKG > /dev/null

