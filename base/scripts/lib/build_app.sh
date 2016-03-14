set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

# clear out the file
> .meteor/platforms

# add new strings
cat <<EOF >> .meteor/platforms
server
browser
EOF

>&2 echo "$1"
>&2 echo "$0"

if [ "$1"  == "true" ]; then
# clear out the file
> .meteor/platforms

# add new strings
cat <<EOF >> .meteor/platforms
firefoxos
server
browser
EOF
fi

meteor build --directory $BUNDLE_DIR --server=http://localhost:3000

cd $BUNDLE_DIR/bundle/programs/server/
npm i

mv $BUNDLE_DIR/bundle /built_app

# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor