#!/usr/bin/env bash
# get the owner of the current directory
dirOwner=$(ls -ld . | awk '{print $3}')
echo "👨 Dir owner: $dirOwner"

echo "🏃 Running 'npm install', please wait..."
cd /var/app
npm install
echo "🏃 'npm install' finished"

cd /var/app
pkill node

# now tail dev/null to keep it running for ever.
echo '🚀 NodeJS container is up'
tail -f /dev/null
