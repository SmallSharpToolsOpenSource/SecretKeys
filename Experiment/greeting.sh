#!/bin/sh

/usr/libexec/PlistBuddy -c "Set :Greeting Hello" Keys.plist
/usr/libexec/PlistBuddy -c "Print :Greeting" Keys.plist

/usr/libexec/PlistBuddy -c "Set :Greeting Goodbye" Keys.plist
/usr/libexec/PlistBuddy -c "Print :Greeting" Keys.plist
