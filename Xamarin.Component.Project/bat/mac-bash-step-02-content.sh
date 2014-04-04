#!/bin/bash

IDE=/Applications/Xamarin\ Studio.app/Contents/MacOS/XamarinStudio


# ======================================================================================
# Build Configuration
CONFIGURATION=Debug

# Locations of the library/utility/app/control to be packaged into Xamarin.Component

FOLDER_LIBRARY_ANDROID=../../AndroidClassLibrary1
FOLDER_LIBRARY_IOS=../../IOSClassLibrary

FOLDER_SAMPLE_ANDROID=../../AndroidApplication1
FOLDER_SAMPLE_IOS=../../IOSApplication

FOLDER_CONTENT=../content
FOLDER_CONTENT_LIB=$FOLDER_CONTENT/lib
FOLDER_CONTENT_SAMPLES=$FOLDER_CONTENT/samples
FOLDER_CONTENT_SAMPLE_ANDROID=${FOLDER_CONTENT_SAMPLES}/Android/
FOLDER_CONTENT_SAMPLE_IOS=${FOLDER_CONTENT_SAMPLES}/iOS/

PROJECT_APPLICATION_ANDROID=${FOLDER_CONTENT_SAMPLES}/Android/AndroidApplication1.csproj
PROJECT_APPLICATION_IOS=${FOLDER_CONTENT_SAMPLES}/iOS/IOSApplication.csproj

# ======================================================================================

rm -fr $FOLDER_CONTENT_LIB
rm -fr $FOLDER_CONTENT_SAMPLES

mkdir ${FOLDER_CONTENT_LIB}/
mkdir ${FOLDER_CONTENT_LIB}/Android
mkdir ${FOLDER_CONTENT_LIB}/iOS

mkdir ${FOLDER_CONTENT_SAMPLES}
mkdir ${FOLDER_CONTENT_SAMPLE_ANDROID}
mkdir ${FOLDER_CONTENT_SAMPLE_IOS}

ls -al $FOLDER_CONTENT_SAMPLES
ls -al $FOLDER_CONTENT_SAMPLE_ANDROID
ls -al $FOLDER_CONTENT_SAMPLE_IOS

cp \
	-fR \
	${FOLDER_LIBRARY_ANDROID}/bin/${CONFIGURATION}/*.dll \
	${FOLDER_CONTENT_LIB}/Android/


cp \
	-fR \
	${FOLDER_LIBRARY_IOS}/bin/${CONFIGURATION}/*.dll \
	${FOLDER_CONTENT_LIB}/iOS/

ls -alR ${FOLDER_CONTENT_LIB}/


cp \
	-fR \
	$FOLDER_SAMPLE_ANDROID \
	$FOLDER_CONTENT_SAMPLES/Android/


cp \
	-fR \
	$FOLDER_SAMPLE_IOS \
	$FOLDER_CONTENT_SAMPLES/iOS/

ls -alR ${FOLDER_CONTENT_SAMPLES}/

echo
echo ======================================================================================================
echo NOTE:
echo		Change References!!! 
echo		DO not use ProjectReferences
echo
echo If there is something like :
echo "  <ItemGroup>"
echo "    <ProjectReference Include="../AndroidClassLibrary1/AndroidClassLibrary1.csproj">"
echo "      <Project>{1C4B4D18-40FF-4AB5-8B7E-BD992C49643F}</Project>"
echo "      <Name>AndroidClassLibrary1</Name>"
echo "    </ProjectReference>"
echo "  </ItemGroup>"
echo
echo "  <ItemGroup>"
echo "    <ProjectReference Include="../IOSClassLibrary/IOSClassLibrary.csproj">"
echo "      <Project>{736CF42C-7E6F-4E65-BDC7-94BB7C59C98A}</Project>"
echo "      <Name>IOSClassLibrary</Name>"
echo "    </ProjectReference>"
echo "  </ItemGroup>"
echo 
echo Change to:
echo 
echo "  <ItemGroup>"
echo "    <Reference Include="IOSClassLibrary">"
echo "      <HintPath>../../lib/iOS/IOSClassLibrary.dll</HintPath>"
echo "    </Reference>"
echo 
echo "  <ItemGroup>"
echo "    <Reference Include="AndroidClassLibrary1, Version=1.0.0.0, Culture=neutral, processorArchitecture=MSIL">"
echo "      <SpecificVersion>False</SpecificVersion>"
echo "      <HintPath>../../lib/Android/AndroidClassLibrary1.dll</HintPath>"
echo "    </Reference>"
echo "  </ItemGroup>"
echo ======================================================================================================

echo
echo
echo
echo !!!! Press Any Key to Start IDE to change references !!!!
echo
echo
echo

# notepad \
# 		%FOLDER_CONTENT_SAMPLES%/Android/AndroidApplication1.csproj
# 
# notepad \
# 		%FOLDER_CONTENT_SAMPLES%/iOS/IOSApplication.csproj
# 

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo ${DIR}

cd ${FOLDER_CONTENT_SAMPLES}/Android/
rm -f *.sln
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



