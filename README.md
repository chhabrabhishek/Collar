# Smart Collar

This project was generated with [Flutter](https://flutter.dev) version Flutter 2.2.1

# Prerequisites

This flutter project needs the following requirements to run :

- Flutter And Dart Installed (Including the SDKs)
- Android Studio Installed, if app needs to run on Android Devices
- XCode Installed, if app needs to run on IoS Devices
- Simulators/Mobile Devices to deploy the application
- Visual Studio Code with Flutter plugin as a workspace (or Android Studio could be used)

## Getting Started

This project is a starting point for this Smart Collar flutter application.

1. Go to [Flutter](https://flutter.dev/docs/get-started/install) to install it on your system.
2. Go to [Android Dev](https://developer.android.com/studio) to install Android Studio in your system.
3. Get [VS Code](https://code.visualstudio.com) as a workspace to edit the code.
4. Clone the [Collar](https://github.com/chhabrabhishek/Collar) application, and run ```flutter pub get``` to install the dependencies.
5. Connect a device/Open a simulator to deploy the application using ```flutter run``` command.
6. The application will be deployed to your device and will start running.

## Alternate Installations

1. You can also builds APKs of the application using ```flutter build apk --release``` command.
2. Then you can paste the generated apk in your device and install it manually.

**Note** - You can download the already generated APK from [this location](https://github.com/chhabrabhishek/Collar/blob/master/app-debug.apk), and install it directly in your device to use it right away.

## Working

As soon as the collar application will be opened in your device, it will ask for certain location permissions. You have to allow these permissions to have the location enabled for the collar.
After you provide the necessary permissions, the screen will show you your current location and the current weather/temperature based on your location.

**The app is a simulation of a smart collar which will be tied to animals. So, the application will keep on producing current locations and weather, even if the app is running in background**
