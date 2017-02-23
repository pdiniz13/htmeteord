set -e

# apt-get -y update
curl https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz > ruby.tar.gz
tar -xvzf ruby.tar.gz
rm ruby.tar.gz
cd ruby-2.3.3
./configure
make 
make install
cd ..
rm -r ruby-2.3.3
gem install bundler

cd $NODE_DIR
mkdir -p /usr/src/app
