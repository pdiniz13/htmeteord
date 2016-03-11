## Borrowed from: https://github.com/chriswessels/meteor-tupperware

set -e
# Autoremove any junk

apt-get autoremove -y

apt-get clean

rm -rf /var/lib/apt/lists/* 

# Clean out docs
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo

# Clean out package management dirs
rm -rf /var/lib/cache /var/lib/log

# Clean out /tmp
rm -rf /tmp/*

# Clear npm cache
npm cache clear