#!/bin/bash

mydir="$(dirname "$BASH_SOURCE")"


echo $mydir

read

set -e

XBUILD=/Library/Frameworks/Mono.framework/Versions/3.4.0/bin/xbuild

rm -fr ../bin/
rm -fr ../obj/
rm -fr ../lo gs/
rm -fr ../content/lib/


mkdir ../logs/


# ======================================================================================
# Build Configuration
CONFIGURATION=Debug

# Locations of the library/utility/app/control to be packaged into Xamarin.Component
FOLDER_LIBRARY_ANDROID=../AndroidClassLibrary1
FOLDER_LIBRARY_IOS=../../IOSClassLibrary
FOLDER_APPLICATION_ANDROID=../AndroidApplication1
FOLDER_APPLICATION_IOS=../../IOSApplication1

# Projects of the library/utility/app/control to be packaged into Xamarin.Component
PROJECT_LIBRARY_ANDROID=AndroidClassLibrary1.csproj
PROJECT_LIBRARY_IOS=IOSClassLibrary.csproj
PROJECT_APPLICATION_ANDROID=AndroidApplication1.csproj
PROJECT_APPLICATION_IOS=IOSApplication.csproj

# Logs
LOG_ANDROID=../logs/Build.Android.Log
LOG_IOS=../logs/Build.IOS.Log

# ======================================================================================

echo	XBUILD=$XBUILD
echo	$FOLDER_ANDROID/$PROJECT_ANDROID


$XBUILD \
		$FOLDER_LIBRARY_ANDROID/$PROJECT_LIBRARY_ANDROID \
		/p:Configuration=$CONFIGURATION \
		/verbosity:diagnostic

$XBUILD \
		$FOLDER_APPLICATION_ANDROID/$PROJECT_APPLICATION_ANDROID \
		/p:Configuration=$CONFIGURATION \
		/verbosity:diagnostic

$XBUILD \
		$FOLDER_LIBRARY_IOS/$PROJECT_LIBRARY_IOS \
		/p:Configuration=$CONFIGURATION \
		/verbosity:diagnostic

$XBUILD \
		$FOLDER_APPLICATION_IOS/$PROJECT_APPLICATION_IOS \
		/p:Configuration=$CONFIGURATION \
		/verbosity:diagnostic

read -p "Press [Enter] key to continue..."


if [ $? != 0 ]
	then
		echo "error occured"
		read
fi
