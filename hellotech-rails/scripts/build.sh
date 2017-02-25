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
curl -sL https://deb.nodesource.com/setup_6.x | bash
apt-get install -y nodejs mysql-client postgresql-client wkhtmltopdf xvfb git libsqlite3-dev nano zlib1g redis-server rabbitmq-server graphviz ghostscript libcdt5 libglapi-mesa libgvc6 librsvg2-common libtiffxx5 libxdot4 libgvpr2 imagemagick libmagickcore5-extra libmagickcore-dev libmagickwand-dev ghostscript gsfonts-x11 netpbm libpaper-utils libpathplan4 ntp oracle-java8-installer oracle-java8-set-default unzip xfonts-base xorg-sgml-doctools discover htop libcroco3 liblzo2-2 libudev1 libpthread-stubs0-dev --no-install-recommends
wget https://openresty.org/download/openresty-1.11.2.2.tar.gz
tar -xvzf openresty-1.11.2.2.tar.gz
cd openresty-1.11.2.2
./configure --with-luajit --with-http_gzip_static_module --with-http_iconv_module --with-ipv6 && make && make install
cd ..
apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg
echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get -y update && apt-get install -y yarn
export PATH="$PATH:$HOME/.yarn/bin"
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
tar xf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
rm wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
mv wkhtmltox /usr/share
ln -sf /usr/share/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
ln -sf /usr/share/wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
wget https://htstatic.blob.core.windows.net/static/mesos/phantomjs-2.1.1-linux-x86_64.tar.bz2
export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
tar xvjf $PHANTOM_JS.tar.bz2
mv $PHANTOM_JS /usr/local/share
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
rm -rf /var/lib/apt/lists/*
gem install rails --version "$RAILS_VERSION"
cd $RUBY_DIR
bundle install
mkdir -p /usr/src/app
