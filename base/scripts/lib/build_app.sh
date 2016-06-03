set -e

echo "Installing Meteor..."
bash $METEORD_DIR/lib/install_meteor.sh

echo "Building app..."

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
echo "Copying app to new dir..."
cp -R /app $COPIED_APP_PATH
echo "Changing to new dir..."
cd $COPIED_APP_PATH

# echo "Dealing with platforms file..."
# # clear out the file
# > .meteor/platforms

# add new strings
# cat <<EOF >> .meteor/platforms
# server
# browser
# EOF
#
# if [ "$1"  == 'true' ]; then
#   echo "Building for mobile..."
#   # clear out the file
#   > .meteor/platforms
#
#   # add new strings
#   cat <<EOF >> .meteor/platforms
#   firefoxos
#   server
#   browser
# EOF
# fi

echo "Doing meteor 'build' app..."
sudo meteor build --directory $BUNDLE_DIR --server=http://localhost:3000 --server-only

echo "Changing to bundle dir..."
cd $BUNDLE_DIR/bundle/programs/server/
echo "Building npm cache..."
npm i

echo "Moving bundle dir..."
mv $BUNDLE_DIR/bundle /built_app

echo "Cleaaning up..."
# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor
