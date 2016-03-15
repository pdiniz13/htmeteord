## Borrowed from: https://github.com/chriswessels/meteor-tupperware

set -e
# Autoremove any junk

apt-get autoremove -y

apt-get clean

rm -rf /var/lib/apt/lists/* || true

# Clean out docs
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo || true

# Clean out package management dirs
rm -rf /var/lib/cache /var/lib/log || true

# Clean out /tmp
rm -rf /tmp/* || true

# Clear npm cache
npm cache clear