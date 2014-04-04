#!/bin/bash

MONO=mono
XAMARIN_COMPONENT=../sbin/xamarin-component.exe

# ======================================================================================
# Locations of the library/utility/app/control to be packaged into Xamarin.Component
#
#
FOLDER_CONTENT_LIBS=..\content\libs
FOLDER_CONTENT_SAMPLES=..\content\samples
#
#
COMPONENT_NAME=XamarinSampleComponent
COMPONENT_VERSION=1.0
COMPONENT_SUMMARY="Xamarin Sample Component template and packaging process"
COMPONENT_PUBLISHER="Xamarin"
COMPONENT_WEBSITE="http://xamarin.com"

# Icon names must contain component name!
COMPONENT_ICON_128x128="../content/icons/${COMPONENT_NAME}_128x128.png"
COMPONENT_ICON_512x512=../content/icons/${COMPONENT_NAME}_512x512.png

# Documentation
COMPONENT_DOCUMENTATION_DETAILS="../content/Details.md"
COMPONENT_DOCUMENTATION_GETTINGSTARTED="../content/GettingStarted.md"
COMPONENT_DOCUMENTATION_LICENSE="../content/License.md"

# Folders where Assemblies/DLLs will be packed ?!!?!?!?!?
# change this and see XAM package
# 
COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_ANDROID="Android"
COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_IOS="aaiOS"

# Assembly DLL locations
COMPONENT_LIBRARY_PATH_ANDROID="../content/lib/Android/AndroidClassLibrary1.dll"
COMPONENT_LIBRARY_PATH_IOS="../content/lib/iOS/IOSClassLibrary.dll"

# Samples point to Sample solution sln files
COMPONENT_SAMPLE_PATH_ANDROID="../content/samples/Android/AndroidApplication1.sln"
COMPONENT_SAMPLE_PATH_IOS="../content/samples/iOS/IOSApplication.sln"

# Description for the samples. NOTE: 2 sentences minimum!!
#
#COMPONENT_SAMPLE_DESCRIPTION_ANDROID="${COMPONENT_NAME}. to help authors. Android sample. dadsdas.ddas.d.ads"
#COMPONENT_SAMPLE_DESCRIPTION_IOS="${COMPONENT_NAME}. to help authors. iOS sample. dadsdas.ddas.d.ads"
COMPONENT_SAMPLE_DESCRIPTION_ANDROID="Sentence 1. Sentence 2."
COMPONENT_SAMPLE_DESCRIPTION_IOS="Sentence 1. Sentence 2."
# ======================================================================================

COMPONENT_NAME_FOR_PACKAGE=${COMPONENT_NAME}-${COMPONENT_VERSION}

rm -fr \
		../$COMPONENT_NAME_FOR_PACKAGE.xam \
		../$COMPONENT_NAME_FOR_PACKAGE.xam.zip

rm -fr ../$COMPONENT_NAME_FOR_PACKAGE.xam.zip

ls -al ../content/lib/
ls -al ../content/samples

pwd
ls -al ../content/samples/Android/AndroidApplication1.sln

$MONO \
	$XAMARIN_COMPONENT \
		create-manually \
		../${COMPONENT_NAME_FOR_PACKAGE}.xam \
		--name=$COMPONENT_NAME \
		--summary=$COMPONENT_SUMMARY \
		--publisher=$COMPONENT_PUBLISHER \
		--website=$COMPONENT_WEBSITE \
		--details=$COMPONENT_DOCUMENTATION_DETAILS \
		--license=$COMPONENT_DOCUMENTATION_LICENSE \
		--getting-started=$COMPONENT_DOCUMENTATION_GETTINGSTARTED \
		--icon=$COMPONENT_ICON_128x128 \
		--icon=$COMPONENT_ICON_512x512 \
		--library="${COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_ANDROID}":"${COMPONENT_LIBRARY_PATH_ANDROID}" \
		--library="${COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_IOS}":"${COMPONENT_LIBRARY_PATH_IOS}" \
		--sample="${COMPONENT_SAMPLE_DESCRIPTION_ANDROID}":"${COMPONENT_SAMPLE_PATH_ANDROID}" \
		--sample="${COMPONENT_SAMPLE_DESCRIPTION_IOS}":"${COMPONENT_SAMPLE_PATH_IOS}"


	

