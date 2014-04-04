@echo on
setlocal ENABLEDELAYEDEXPANSION

::call "%PROGRAMFILES%\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
call "%PROGRAMFILES(x86)%\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"


rmdir /q /s ..\bin\
rmdir /q /s ..\obj\
rmdir /q /s ..\logs\
rmdir /q /s ..\content\lib\

mkdir ..\logs\


:: ======================================================================================
:: Build Configuration
set CONFIGURATION=Debug

:: Locations of the library/utility/app/control to be packaged into Xamarin.Component
set FOLDER_LIBRARY_ANDROID=..\..\AndroidClassLibrary1
set FOLDER_LIBRARY_IOS=..\..\IOSClassLibrary
set FOLDER_APPLICATION_ANDROID=..\..\AndroidApplication1
set FOLDER_APPLICATION_IOS=..\..\IOSApplication

:: Projects of the library/utility/app/control to be packaged into Xamarin.Component
set PROJECT_LIBRARY_ANDROID=AndroidClassLibrary1.csproj
set PROJECT_LIBRARY_IOS=IOSClassLibrary.csproj
set PROJECT_APPLICATION_ANDROID=AndroidApplication1.csproj
set PROJECT_APPLICATION_IOS=IOSApplication.csproj

:: Logs
set LOG_ANDROID=..\logs\Build.Android.Log
set LOG_IOS=..\logs\Build.IOS.Log

:: ======================================================================================


msbuild ^
		%FOLDER_LIBRARY_ANDROID%\%PROJECT_LIBRARY_ANDROID% ^
		/p:Configuration=%CONFIGURATION% ^
		/fileLogger ^
		/flp:logfile=%LOG_ANDROID% ^
		/detailedsummary ^
		/verbosity:diagnostic

msbuild ^
		%FOLDER_APPLICATION_ANDROID%\%PROJECT_APPLICATION_ANDROID% ^
		/p:Configuration=%CONFIGURATION% ^
		/fileLogger ^
		/flp:logfile=%LOG_ANDROID% ^
		/detailedsummary ^
		/verbosity:diagnostic

msbuild ^
		%FOLDER_LIBRARY_IOS%\%PROJECT_LIBRARY_IOS% ^
		/p:Configuration=%CONFIGURATION% ^
		/fileLogger ^
		/flp:logfile=%LOG_ANDROID% ^
		/detailedsummary ^
		/verbosity:diagnostic

msbuild ^
		%FOLDER_APPLICATION_IOS%\%PROJECT_APPLICATION_IOS% ^
		/p:Configuration=%CONFIGURATION% ^
		/fileLogger ^
		/flp:logfile=%LOG_ANDROID% ^
		/detailedsummary ^
		/verbosity:diagnostic

@IF %ERRORLEVEL% NEQ 0 PAUSE	
