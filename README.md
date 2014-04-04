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

1.	compile [optional step]		
	This step whether test libraries and samples are compile clean		
2. 	copy content		
	This step will 		
	1.	copy libraries and samples into folder structure prepared for packing 	
		Xamarin Component (xam) file.
	2.	will opend in-place projects prepared for packing with IDE (Xamarin Studio or
		Visual Studio) in order to allow component author to change references. 	
		Namely components should not have Project References, only assembly references 		
		from the folder structure prepared for packing. (step 2.1.)
3.	pack XAM file - Xamarin component		
	This step will prepare all the data and variables for proper packing and will pack the		
	component.
4.	test package		
	Test step actually unpacks (Xamarin Component, xam file - zip file) and opens samples with		
	IDE in order to test whether packed samples are compile clean and able to run.		
	If samples are not compile clean - check the references -  this is the most common problem.		
	
	
# Details

## Steps

## Variable descriptions