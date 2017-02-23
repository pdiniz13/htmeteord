set -e

apt-get -y update
apt-get install -y mysql-client postgresql-client wkhtmltopdf xvfb git libsqlite3-dev nano zlib1g redis-server rabbitmq-server graphviz ghostscript libcdt5 libglapi-mesa libgvc6 librsvg2-common libtiffxx5 libxdot4 libgvpr2 imagemagick libmagickcore5-extra libmagickcore-dev libmagickwand-dev ghostscript gsfonts-x11 netpbm libpaper-utils libpathplan4 ntp oracle-java8-installer oracle-java8-set-default unzip xfonts-base xorg-sgml-doctools discover htop libcroco3 liblzo2-2 libudev1 libpthread-stubs0-dev --no-install-recommends

wget http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
tar xf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
rm wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
mv wkhtmltox /usr/share
ln -sf /usr/share/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
ln -sf /usr/share/wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
wget https://htstatic.blob.core.windows.net/static/mesos/phantomjs-2.1.1-linux-x86_64.tar.bz2
export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
tar xvjf $PHANTOM_JS.tar.bz2
rm $PHANTOM_JS.tar.bz2
mv $PHANTOM_JS /usr/local/share
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
rm -rf /var/lib/apt/lists/*

cd $RUBY_DIR
bundle install
mkdir -p /usr/src/app
