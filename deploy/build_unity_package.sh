#!/bin/bash

echo "Start Build for AppsFlyer.unitypackage"

DEPLOY_PATH=outputs
UNITY_PATH="/Applications/Unity/Unity.app/Contents/MacOS/Unity"
PACKAGE_NAME="AppsFlyer-AdRevenue.unitypackage"
FILE_LIST=$(<unity_package_file_list)
mkdir -p $DEPLOY_PATH


# Build the .unitypackage
/Applications/Unity/Hub/Editor/2019.1.8f1/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-logFile create_unity_core.log \
-projectPath $PWD/../ \
-exportPackage \
$FILE_LIST \
$PWD/$DEPLOY_PATH/$PACKAGE_NAME \
-quit \
&& echo "package exported successfully to outputs/AppsFlyer-AdRevenue.unitypackage.unitypackage" \
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
