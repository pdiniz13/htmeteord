set -e

apt-get -y update
apt-get install -y --no-install-recommends software-properties-common python-software-properties
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update -y
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo "deb http://ftp.us.debian.org/debian/ oldstable main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://ftp.us.debian.org/debian/ oldstable main contrib non-free" >> /etc/apt/sources.list
apt-get -y update
apt-get install -y nodejs mysql-client postgresql-client xvfb git libsqlite3-dev nano zlib1g graphviz ghostscript libcdt5 libglapi-mesa libgvc6 librsvg2-common libtiffxx5 libxdot4 libgvpr2 ghostscript gsfonts-x11 netpbm libpaper-utils libpathplan4 ntp oracle-java8-installer oracle-java8-set-default unzip xfonts-base xorg-sgml-doctools discover htop libcroco3 liblzo2-2 libudev1 libpthread-stubs0-dev --no-install-recommends
wget https://openresty.org/download/openresty-1.9.7.5.tar.gz
tar -xvzf openresty-1.9.7.5.tar.gz
cd openresty-1.9.7.5
./configure --with-luajit --with-http_gzip_static_module --with-http_iconv_module --with-ipv6 && make && make install
cd ..
rm -rf /var/lib/apt/lists/*
gem install rails --version "$RAILS_VERSION"
cd $RUBY_DIR
bundle install
mkdir -p /usr/src/app
