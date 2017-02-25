set -e

apt-get -y update
apt-get install -y --no-install-recommends software-properties-common python-software-properties
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo "deb http://ftp.us.debian.org/debian/ oldstable main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://ftp.us.debian.org/debian/ oldstable main contrib non-free" >> /etc/apt/sources.list
apt-get -y update
apt-get install -y git nano ntp oracle-java8-installer oracle-java8-set-default unzip xfonts-base xorg-sgml-doctools discover htop libcroco3 liblzo2-2 libudev1 libpthread-stubs0-dev --no-install-recommends
wget https://openresty.org/download/openresty-1.11.2.2.tar.gz
tar -xvzf openresty-1.11.2.2.tar.gz
cd openresty-1.11.2.2
./configure --with-luajit --with-http_gzip_static_module --with-http_iconv_module --with-ipv6 && make && make install
cd ..
apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg
echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get -y update && apt-get install -y yarn
export PATH="$PATH:$HOME/.yarn/bin"

cd $NODE_DIR
mkdir -p /usr/src/app
