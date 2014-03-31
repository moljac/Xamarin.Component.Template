# Xamarin.Component.Template

## Intro

This solution is sample solution for creating and testing Xamarin Component. 

The solution consists of:

1.	Android library - component/package for Android		
	this could be replaced with Java Binding Library		
	Name: AndroidClassLibrary1		
2.	iOS library	- component/package for iOS			
	this could be replaced with Objective-C Binding Library		
	Name: IOSClassLibrary
3.	Android sample application 			
	Samples usess Android Library and presents usage of the library			
	Name: AndroidApplication1					
	Note: Android application references library as ProjectReference 		
	!!! This must be changed prior to packing !!!									
	!!! Only assemblies/dlls are packed !!!
4.	iOS sample application 			
	Samples usess iOS Library and presents usage of the library			
	Name:  					
	Note: iOS Application references library as ProjectReference						
	!!! This must be changed prior to packing !!!	
	!!! Only assemblies/dlls are packed !!!
	
TODO: Windows Phone Assembly/library and Application


Process in 4 steps:

1.	compile 
2. 	copy content
3.	pack XAM file - Xamarin component
4.	test package