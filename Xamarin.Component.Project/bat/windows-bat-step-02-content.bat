@echo on
setlocal ENABLEDELAYEDEXPANSION

::call "%PROGRAMFILES%\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
call "%PROGRAMFILES(x86)%\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"

set IDE=devenv

:: ======================================================================================
:: Build Configuration
set CONFIGURATION=Debug

:: Locations of the library/utility/app/control to be packaged into Xamarin.Component

set FOLDER_LIBRARY_ANDROID=..\..\AndroidClassLibrary1
set FOLDER_LIBRARY_IOS=..\..\IOSClassLibrary

set FOLDER_SAMPLE_ANDROID=..\..\AndroidApplication1
set FOLDER_SAMPLE_IOS=..\..\IOSApplication

set FOLDER_CONTENT=..\content
set FOLDER_CONTENT_LIB=%FOLDER_CONTENT%\lib
set FOLDER_CONTENT_SAMPLES=%FOLDER_CONTENT%\samples
set FOLDER_CONTENT_SAMPLE_ANDROID=%FOLDER_CONTENT_SAMPLES%\Android
set FOLDER_CONTENT_SAMPLE_IOS=%FOLDER_CONTENT_SAMPLES%\iOS

set PROJECT_APPLICATION_ANDROID=AndroidApplication1.csproj
set PROJECT_APPLICATION_IOS=IOSApplication.csproj

:: ======================================================================================

rmdir /q /s %FOLDER_CONTENT_LIB%
rmdir /q /s %FOLDER_CONTENT_SAMPLES%

mkdir %FOLDER_CONTENT_SAMPLES%\
mkdir %FOLDER_CONTENT_SAMPLE_ANDROID%
mkdir %FOLDER_CONTENT_SAMPLE_IOS%


xcopy ^
	/s /y ^
	%FOLDER_LIBRARY_ANDROID%\bin\%CONFIGURATION%\*.dll ^
	%FOLDER_CONTENT_LIB%\Android\

xcopy ^
	/s /y ^
	%FOLDER_LIBRARY_IOS%\bin\%CONFIGURATION%\*.dll ^
	%FOLDER_CONTENT_LIB%\iOS\

xcopy ^
	/s /y ^
	%FOLDER_SAMPLE_ANDROID% ^
	%FOLDER_CONTENT_SAMPLES%\Android\


xcopy ^
	/s /y ^
	%FOLDER_SAMPLE_IOS% ^
	%FOLDER_CONTENT_SAMPLES%\iOS\




CLS
COLOR 0C

echo
echo ======================================================================================================
echo NOTE:
echo		Change References!!! 
echo		DO not use ProjectReferences
echo
echo If there is something like :
echo "  <ItemGroup>"
echo "    <ProjectReference Include="..\AndroidClassLibrary1\AndroidClassLibrary1.csproj">"
echo "      <Project>{1C4B4D18-40FF-4AB5-8B7E-BD992C49643F}</Project>"
echo "      <Name>AndroidClassLibrary1</Name>"
echo "    </ProjectReference>"
echo "  </ItemGroup>"
echo
echo "  <ItemGroup>"
echo "    <ProjectReference Include="..\IOSClassLibrary\IOSClassLibrary.csproj">"
echo "      <Project>{736CF42C-7E6F-4E65-BDC7-94BB7C59C98A}</Project>"
echo "      <Name>IOSClassLibrary</Name>"
echo "    </ProjectReference>"
echo "  </ItemGroup>"
echo 
echo Change to:
echo 
echo "  <ItemGroup>"
echo "    <Reference Include="IOSClassLibrary">"
echo "      <HintPath>..\..\lib\iOS\IOSClassLibrary.dll</HintPath>"
echo "    </Reference>"
echo 
echo "  <ItemGroup>"
echo "    <Reference Include="AndroidClassLibrary1, Version=1.0.0.0, Culture=neutral, processorArchitecture=MSIL">"
echo "      <SpecificVersion>False</SpecificVersion>"
echo "      <HintPath>..\..\lib\Android\AndroidClassLibrary1.dll</HintPath>"
echo "    </Reference>"
echo "  </ItemGroup">
echo ======================================================================================================

echo
echo
echo
echo !!!! Press Any Key to Start IDE to change references !!!!
echo
echo
echo
pause

:: notepad ^
:: 		%FOLDER_CONTENT_SAMPLES%\Android\AndroidApplication1.csproj
:: 
:: notepad ^
:: 		%FOLDER_CONTENT_SAMPLES%\iOS\IOSApplication.csproj
:: 


%IDE% ^
		%FOLDER_CONTENT_SAMPLE_ANDROID%\%PROJECT_APPLICATION_ANDROID%

%IDE% ^
		%FOLDER_CONTENT_SAMPLE_IOS%\%PROJECT_APPLICATION_IOS%



@IF %ERRORLEVEL% NEQ 0 PAUSE	
