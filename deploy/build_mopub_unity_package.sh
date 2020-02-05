#!/bin/bash

echo "Start Build for appsflyer-mopub-adrevenue.unitypackage"

DEPLOY_PATH=outputs
UNITY_PATH="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
PACKAGE_NAME="appsflyer-mopub-adrevenue.unitypackage"
FILE_LIST=$(<mopub_appsflyer_file_list)
mkdir -p $DEPLOY_PATH


# Build the .unitypackage
/Applications/Unity/Hub/Editor/2019.3.0f6/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-logFile create_unity_core.log \
-projectPath $PWD/../ \
-exportPackage \
$FILE_LIST \
$PWD/$DEPLOY_PATH/$PACKAGE_NAME \
-quit \
&& echo "package exported successfully to outputs/appsflyer-mopub-adrevenue.unitypackage" \
|| echo "Failed to export package. See create_unity_core.log for more info."


if [ $1 == "-p" ]; then
echo "removing ./Library"
rm -rf ../Library
echo "removing ./Logs"
rm -rf ../Logs
echo "removing ./Packages"
rm -rf ../Packages
echo "removing ./ProjectSettings"
rm -rf ../ProjectSettings
echo "removing ./deploy/create_unity_core.log"
rm ./create_unity_core.log
echo "Moving  $DEPLOY_PATH/$PACKAGE_NAME to root"
mv ./outputs/$PACKAGE_NAME ..
echo "removing ./deploy/outputs"
rm -rf ./outputs
else
echo "dev mode. No files removed. Run with -p flag for production build."
fi
