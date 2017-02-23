set -e

apt-get update
apt-get install -y build-essential libpcre3 libpcre3-dev
wget https://openresty.org/download/openresty-1.9.7.5.tar.gz
tar -xvzf openresty-1.9.7.5.tar.gz
cd openresty-1.9.7.5
./configure --with-luajit --with-http_gzip_static_module --with-http_iconv_module --with-ipv6 && make && make install