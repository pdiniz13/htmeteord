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
apt-get install -y nodejs mysql-client postgresql-client wkhtmltopdf git libsqlite3-dev redis-server rabbitmq-server graphviz ghostscript libcdt5 libglapi-mesa libgvc6 librsvg2-common libtiffxx5 libxdot4 libgvpr2 imagemagick libmagickcore5-extra libmagickcore-dev libmagickwand-dev ghostscript gsfonts-x11 netpbm libpaper-utils libpathplan4 ntp oracle-java8-installer oracle-java8-set-default unzip xfonts-base xorg-sgml-doctools discover htop libcroco3 liblzo2-2 libudev1 libpthread-stubs0-dev nginx --no-install-recommends
rm -rf /var/lib/apt/lists/*
gem install rails --version "$RAILS_VERSION"
cd $RUBY_DIR
bundle install
mkdir -p /usr/src/app
