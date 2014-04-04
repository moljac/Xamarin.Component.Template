#!/bin/bash

IDE=/Applications/Xamarin\ Studio.app/Contents/MacOS/XamarinStudio

# ======================================================================================
# Locations of the library/utility/app/control to be packaged into Xamarin.Component
#
ZIP=unzip
#
FOLDER_CONTENT_LIBS=../content/libs
FOLDER_CONTENT_SAMPLES=../content/samples
#
#
COMPONENT_NAME=XamarinSampleComponent
COMPONENT_VERSION=1.0
# ======================================================================================

COMPONENT_NAME_FOR_PACKAGE=${COMPONENT_NAME}-${COMPONENT_VERSION}

cp -f \
	../${COMPONENT_NAME_FOR_PACKAGE}.xam \
	../${COMPONENT_NAME_FOR_PACKAGE}.zip

rm -fr ../test/
mkdir ../test/

ls -al ../*.zip

$ZIP ../${COMPONENT_NAME_FOR_PACKAGE}.zip -d../test
ls -alR ../test/

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ${DIR}

ls -alR ../test/${COMPONENT_NAME_FOR_PACKAGE}

cd ../test/${COMPONENT_NAME_FOR_PACKAGE}/samples/AndroidApplication1/
"${IDE}" AndroidApplication1.sln
cd ${DIR}

cd ../test/${COMPONENT_NAME_FOR_PACKAGE}/samples/IOSApplication/
"${IDE}" IOSApplication.sln
cd ${DIR}

