#!/bin/bash

# Define variables
URL=https://www.hdsentinel.com/hdslin/hdsentinel_gui64bit.tar.xz
NAME=hdsentinel-gui
VERSION=2.0.0 # Update this with the actual version of HDSentinel

# Download HDSentinel
wget $URL -P ./

# Extract the outer tar.xz archive
tar -xf ./hdsentinel_gui64bit.tar.xz -C ./

# Extract the inner zip archive
unzip ./HDSentinel_GUI/HDSentinel_GUI.zip -d ./

# Clean up the downloaded archives
rm ./hdsentinel_gui64bit.tar.xz
rm -f ./HDSentinel_GUI/HDSentinel_GUI.zip

# Rename the extracted directory to match the package name and version
if [ -d ./$NAME-$VERSION ]; then
    rm -rf ./$NAME-$VERSION
fi
mv ./HDSentinel_GUI $NAME-$VERSION

# Create orig archive
tar czvf ${NAME}_${VERSION}.orig.tar.gz $NAME-$VERSION

cp -rvf ./debian ./$NAME-$VERSION
cd ./$NAME-$VERSION

# Build package
dpkg-buildpackage -uc -us
