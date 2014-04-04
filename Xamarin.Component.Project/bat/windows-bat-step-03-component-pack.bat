::@echo off
setlocal ENABLEDELAYEDEXPANSION

::call "%PROGRAMFILES%\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
call "%PROGRAMFILES(x86)%\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"


set MONO="%PROGRAMFILES(X86)%\Mono-3.2.3\bin\mono.exe"
set XAMARIN_COMPONENT=..\sbin\xamarin-component.exe



:: ======================================================================================
:: Locations of the library/utility/app/control to be packaged into Xamarin.Component
::
::
set FOLDER_CONTENT=..\content\
set FOLDER_CONTENT_LIB=%FOLDER_CONTENT%\lib
set FOLDER_CONTENT_SAMPLES=%FOLDER_CONTENT%\samples
::
::
set COMPONENT_NAME=XamarinSampleComponent
set COMPONENT_VERSION=1.0
set COMPONENT_SUMMARY="Xamarin Sample Component template and packaging process"
set COMPONENT_PUBLISHER="Xamarin"
set COMPONENT_WEBSITE="http://xamarin.com"

:: Icon names must contain component name!
set COMPONENT_ICON_128x128=%FOLDER_CONTENT%\icons\%COMPONENT_NAME%_128x128.png
set COMPONENT_ICON_512x512=%FOLDER_CONTENT%\icons\%COMPONENT_NAME%_512x512.png

:: Documentation
set COMPONENT_DOCUMENTATION_DETAILS="%FOLDER_CONTENT%\Details.md"
set COMPONENT_DOCUMENTATION_GETTINGSTARTED="%FOLDER_CONTENT%\GettingStarted.md"
set COMPONENT_DOCUMENTATION_LICENSE="%FOLDER_CONTENT%\License.md"

:: Folders where Assemblies\DLLs will be packed ?!!?!?!?!?
:: change this and see XAM package
:: 
set COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_ANDROID="Android"
set COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_IOS="aaiOS"

:: Assembly DLL locations
set COMPONENT_LIBRARY_PATH_ANDROID="%FOLDER_CONTENT_LIB%\Android\AndroidClassLibrary1.dll"
set COMPONENT_LIBRARY_PATH_IOS="%FOLDER_CONTENT_LIB%\iOS\IOSClassLibrary.dll"

:: Samples point to Sample solution sln files
set COMPONENT_SAMPLE_PATH_ANDROID="%FOLDER_CONTENT_SAMPLES%\Android\AndroidApplication1.sln"
set COMPONENT_SAMPLE_PATH_IOS="%FOLDER_CONTENT_SAMPLES%\iOS\IOSApplication.sln"

:: Description for the samples. NOTE: 2 sentences minimum!!
::
set COMPONENT_SAMPLE_DESCRIPTION_ANDROID="${COMPONENT_NAME} to help authors. Android sample."
set COMPONENT_SAMPLE_DESCRIPTION_IOS="${COMPONENT_NAME} to help authors. iOS sample."
:: ======================================================================================

set COMPONENT_NAME_FOR_PACKAGE=%COMPONENT_NAME%-%COMPONENT_VERSION%

echo COMPONENT_LIBRARY_PATH_ANDROID="%FOLDER_CONTENT_LIB%/Android/AndroidClassLibrary1.dll"
echo COMPONENT_LIBRARY_PATH_IOS="%FOLDER_CONTENT_LIB%/iOS/IOSClassLibrary.dll"

echo %COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_ANDROID%:%COMPONENT_LIBRARY_PATH_ANDROID%
echo %COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_IOS%:%COMPONENT_LIBRARY_PATH_IOS%

del /Q ^
		..\%COMPONENT_NAME_FOR_PACKAGE%.xam ^
		..\%COMPONENT_NAME_FOR_PACKAGE%.xam.zip

rmdir /q /s ..\%COMPONENT_NAME_FOR_PACKAGE%.xam.zip

dir /s %COMPONENT_LIBRARY_PATH_ANDROID%
dir /s %COMPONENT_LIBRARY_PATH_IOS%


%MONO% ^
	%XAMARIN_COMPONENT% ^
		create-manually ^
		..\%COMPONENT_NAME_FOR_PACKAGE%.xam ^
		--name=%COMPONENT_NAME% ^
		--summary=%COMPONENT_SUMMARY% ^
		--publisher=%COMPONENT_PUBLISHER% ^
		--website=%COMPONENT_WEBSITE% ^
		--details=%COMPONENT_DOCUMENTATION_DETAILS% ^
		--license=%COMPONENT_DOCUMENTATION_LICENSE% ^
		--getting-started=%COMPONENT_DOCUMENTATION_GETTINGSTARTED% ^
		--icon=%COMPONENT_ICON_128x128% ^
		--icon=%COMPONENT_ICON_512x512% ^
		--library=%COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_ANDROID%:%COMPONENT_LIBRARY_PATH_ANDROID% ^
		--sample=%COMPONENT_SAMPLE_DESCRIPTION_ANDROID%:%COMPONENT_SAMPLE_PATH_ANDROID% ^
		--library=%COMPONENT_LIBRARY_FRAMEWORK_PLATFORM_ID_IOS%:%COMPONENT_LIBRARY_PATH_IOS% ^
		--sample=%COMPONENT_SAMPLE_DESCRIPTION_IOS%:%COMPONENT_SAMPLE_PATH_IOS%
	


@IF %ERRORLEVEL% NEQ 0 PAUSE	
