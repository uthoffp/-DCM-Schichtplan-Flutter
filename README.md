# DCM Schichtplan
Flutter Version of the CiF DCM Personalmanager for iOS and Android.

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/uthoffp/DCM-Schichtplan-Flutter.git
```

**Step 2:**
Follow the Getting Started guide by Flutter to setup flutter on your system:
```
https://docs.flutter.dev/get-started/install
```

**Step 3:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we I been using in this project. The lib folder contains the main code for the application. This project uses the MVVM Pattern.

```
lib/
|- repositories/
|- resources/
|- view/
|- viewmodel/
```

The lib directory contains the following structure:

```
1- repositories - This directory contaitains all data classes and api calls used by the application. The datasource subdirectory contains all api calls. Data classes are organised in the model subdirectory.
2- resources - All application level constants are defined in this directory within their respective files. 
3- viewmodel - Contains viewmodel for all ui screens.
4- ui — Contains all the ui of the project, contains sub directory for each screen or fragment.
5- main.dart - This is the starting point for the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Install Flutter DCM-Schichtplan
To install the DCM-Schichtplan release build on your Android device copy dcm-schitplan.apk on your device and execute it.