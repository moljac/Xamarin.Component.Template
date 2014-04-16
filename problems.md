AndroidLibrary Project

Workaround:

	nuke bin/ obj/
	XS open compile OK
	
xbuild
	error CS1703: 
	An assembly with the same identity `mscorlib, Version=2.0.5.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e' 
	has already been imported. Consider removing one of the references

	
	 error CS1703: 
	 An assembly with the same identity `mscorlib, Version=2.0.5.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e' 
	 has already been imported. Consider removing one of the references
		/Library/Frameworks/Xamarin.Android.framework/Versions/Current/bin/../lib/xbuild-frameworks/MonoAndroid/v1.0/mscorlib.dll 
		(Location of the symbol related to previous error)
		/Library/Frameworks/Mono.framework/External/xbuild-frameworks/MonoAndroid/v1.0/mscorlib.dll 
		(Location of the symbol related to previous error)
		Tool /Library/Frameworks/Xamarin.Android.framework/Versions/Current/bin/smcs execution finished.
	Task "Csc" execution -- FAILED
	Done building target "CoreCompile" in project 
	"Xamarin.Component.Template.Folder/AndroidApplication1/AndroidApplication1.csproj".-- FAILED


## Library Framework	
--library:<Framework>:<PathToDLL>

<Framework> wrong! iOS Android

Variables:

	set COMPONENT_LIBRARY_SUBFOLDER_ANDROID="Android"
	set COMPONENT_LIBRARY_SUB_IOS="iOS"

Resulting in:

	"Android":"..\content\\lib\Android\AndroidClassLibrary1.dll"
	:"..\content\\lib\iOS\IOSClassLibrary.dll"

Unhandled Exception:
System.ApplicationException: Library framework must be specified.
  at Xamarin.Components.Packaging.Creation.PackageCreator.WriteLibrary (ICSharpCode.SharpZipLib.Zip.ZipOutputStream zipS
tream, Xamarin.Components.Packaging.Creation.PackageSpec spec, Xamarin.Components.Packaging.Creation.LibrarySpec library
) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.Creation.PackageCreator.CreatePackage (Xamarin.Components.Packaging.Creation.PackageSp
ec spec) [0x00000] in <filename unknown>:0
  at Xamarin.Components.CreateManuallyCommandHandler.Invoke (System.String[] args) [0x00000] in <filename unknown>:0
  at Xamarin.Components.MainClass.Main (System.String[] args) [0x00000] in <filename unknown>:0
[ERROR] FATAL UNHANDLED EXCEPTION: System.ApplicationException: Library framework must be specified.
  at Xamarin.Components.Packaging.Creation.PackageCreator.WriteLibrary (ICSharpCode.SharpZipLib.Zip.ZipOutputStream zipS
tream, Xamarin.Components.Packaging.Creation.PackageSpec spec, Xamarin.Components.Packaging.Creation.LibrarySpec library
) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.Creation.PackageCreator.CreatePackage (Xamarin.Components.Packaging.Creation.PackageSp
ec spec) [0x00000] in <filename unknown>:0
  at Xamarin.Components.CreateManuallyCommandHandler.Invoke (System.String[] args) [0x00000] in <filename unknown>:0
  at Xamarin.Components.MainClass.Main (System.String[] args) [0x00000] in <filename unknown>:0



2014-04-02 No mention of Library framework

Component libraries are specified to xamarin-component with flags of the form 
--library="Platform ID":"path/to/.dll". Currently, the following platforms are supported:


Platform ID	Description
android	Xamarin.Android
ios	Xamarin.iOS
winphone-7.0	Windows Phone 7.0
winphone-7.1	Windows Phone 7.1
mobile	Xamarin.iOS, Xamarin.Android, and Windows Phone 7.0







Unhandled Exception:
Xamarin.Components.Packaging.InvalidManifestException: If publisher-url is specified, it must be well formed.
  at Xamarin.Components.Packaging.ComponentManifest.set_PublisherUrl (System.String value) [0x00000] in <filename unknow
n>:0
  at Xamarin.Components.Packaging.ComponentManifest.FromXDocument (System.Xml.Linq.XDocument doc) [0x00000] in <filename
 unknown>:0
  at Xamarin.Components.Packaging.ComponentManifest.FromStream (System.IO.Stream s) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.ComponentPackage.LoadAndCheckManifest (System.String expectedId, System.String expecte
dVersion, System.String expectedDirectoryName) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.ComponentPackage.Init () [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.ComponentPackage..ctor (System.String file) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.Creation.PackageCreator.ValidatePackage (System.String packagePath) [0x00000] in <file
name unknown>:0
  at Xamarin.Components.CreateManuallyCommandHandler.Invoke (System.String[] args) [0x00000] in <filename unknown>:0
[ERROR] FATAL UNHANDLED EXCEPTION: Xamarin.Components.Packaging.InvalidManifestException: If publisher-url is specified,
 it must be well formed.
  at Xamarin.Components.Packaging.ComponentManifest.set_PublisherUrl (System.String value) [0x00000] in <filename unknow
n>:0
  at Xamarin.Components.Packaging.ComponentManifest.FromXDocument (System.Xml.Linq.XDocument doc) [0x00000] in <filename
 unknown>:0
  at Xamarin.Components.Packaging.ComponentManifest.FromStream (System.IO.Stream s) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.ComponentPackage.LoadAndCheckManifest (System.String expectedId, System.String expecte
dVersion, System.String expectedDirectoryName) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.ComponentPackage.Init () [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.ComponentPackage..ctor (System.String file) [0x00000] in <filename unknown>:0
  at Xamarin.Components.Packaging.Creation.PackageCreator.ValidatePackage (System.String packagePath) [0x00000] in <file
name unknown>:0
  at Xamarin.Components.CreateManuallyCommandHandler.Invoke (System.String[] args) [0x00000] in <filename unknown>:0
Press any key to continue . . .

















