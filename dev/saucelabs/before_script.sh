#!/usr/bin/env bash

# Setup and start Sauce Connect for your TravisCI build
# This script requires your .travis.yml to include the following two private env variables:
# SAUCE_USERNAME
# SAUCE_ACCESS_KEY
# Follow the steps at https://saucelabs.com/opensource/travis to set that up.
#
# Curl and run this script as part of your .travis.yml before_script section:
# before_script:

VERSION="4.5.1"
CONNECT_URL="https://saucelabs.com/downloads/sc-$VERSION-osx.zip"
CONNECT_DIR="/tmp/sauce-connect-$RANDOM"
CONNECT_DOWNLOAD="sc-$VERSION-osx.zip"
READY_FILE="connect-ready-$RANDOM"

# Get Connect and start it
mkdir -p $CONNECT_DIR
cd $CONNECT_DIR
curl $CONNECT_URL > $CONNECT_DOWNLOAD
unzip $CONNECT_DOWNLOAD
rm $CONNECT_DOWNLOAD
cd bin
./sc -u $SAUCE_USERNAME -k $SAUCE_ACCESS_KEY --pidfile pid --tunnel-identifier $TRAVIS_JOB_NUMBER &

# Wait for Connect to be ready before exiting
while [ ! -f $READY_FILE ]; do
  sleep .5
done
