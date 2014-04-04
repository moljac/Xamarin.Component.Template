#!/bin/bash


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

read

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ${DIR}

read

cd ../test/Android/
"${IDE}" AndroidApplication1.csproj
pwd
ls -al *.sln
cd ${DIR}

cd ${FOLDER_CONTENT_SAMPLES}/iOS/
rm -f *.sln
"${IDE}" IOSApplication.csproj
pwd
ls -al *.sln
cd ${DIR}

