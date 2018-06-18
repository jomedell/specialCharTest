#!/bin/sh

#  appcenter-post-build.sh
#  VSAC
#
#  Created by Jorge Medellin on 4/23/18.
#  Copyright © 2018 Microsoft. All rights reserved.

set -e

echo "******************************************************"
echo "Post Build Script"
echo "******************************************************"

appCenterAPItoken=$AppCenterToken
appName="VSAC-Organization/VSACiOS"
devices="VSAC-Organization/iphoneset"
testSeries="ScriptTest"

echo ""
echo "Start XCUITest"
echo "App Name: $appName"
echo "Device Set: $devices"
echo "Test Series: $testSeries"
echo ""

echo "Run npm command"

npm install -g appcenter-cli

echo ""

echo "Build UI Test"

#rm -rf DerivedData
xcrun xcodebuild build-for-testing \
-configuration Debug \
-workspace $APPCENTER_SOURCE_DIRECTORY/VSAC.xcworkspace \
-sdk iphoneos \
-scheme VSAC \
-derivedDataPath $APPCENTER_SOURCE_DIRECTORY/TestBundle
#-derivedDataPath $APPCENTER_SOURCE_DIRECTORY/Test


echo ""

echo "Run UI test CLI command"
appcenter login --token

appcenter test run xcuitest --app $appName --devices $devices --app-path $APPCENTER_OUTPUT_DIRECTORY/*.ipa --test-series $testSeries --locale "en_US" --build-dir $APPCENTER_SOURCE_DIRECTORY/TestBundle/Build/Products/Debug-iphoneos

echo "*******************************"
echo "Post Build Script Complete"
echo "*******************************"

#--uitest-tools-dir $APPCENTER_SOURCE_DIRECTORY/packages/*/tools
