#!/bin/sh

#  appcenter-post-build.sh
#  VSAC
#
#  Created by Jorge Medellin on 4/23/18.
#  Copyright © 2018 Microsoft. All rights reserved.

appName="VSAC-Organization/VSACiOS"
devices="VSAC-Organization/iphoneset"
testSeries="ScriptTest"

npm install -g appcenter-cli

xcrun xcodebuild build-for-testing \
-configuration Debug \
-workspace $APPCENTER_SOURCE_DIRECTORY/VSAC.xcworkspace \
-sdk iphoneos \
-scheme VSAC \
-derivedDataPath $APPCENTER_SOURCE_DIRECTORY/Test

appcenter login --token 6157c7acffeaef8f17ee67d8952e70aaeb6f2fa4

appcenter test run xcuitest --app $appName --devices $devices --app-path $APPCENTER_OUTPUT_DIRECTORY/*.ipa --test-series $testSeries --locale "en_US" --build-dir $APPCENTER_SOURCE_DIRECTORY/Test


#--uitest-tools-dir $APPCENTER_SOURCE_DIRECTORY/packages/*/tools
