#!/bin/zsh
echo "Building..."
# swift build -c release # RELEASE BUILD IS BROKEN WITH CURRENT XCODE 12.3 FOR SOME REASON
swift build # DEBUG BUILD to work around broken SPM
echo "Build completed"

EXECUTABLE=.build/debug/fileicon
TARGET=/usr/local/bin
echo "Deploying..."
cp $EXECUTABLE $TARGET
echo "Copied $EXECUTABLE to $TARGET"
