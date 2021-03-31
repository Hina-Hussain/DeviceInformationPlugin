# Device Information

A flutter plugin to get device information such as device IMEI number, model name, API level, etc for both android & iOS.

## Installation

Add following dependency in pubspec.yaml file:

```bash
device_information:^0.0.1
```
Install by running:

```bash
$ flutter pub get 
```

## Usage

```
import 'package:device_information/device_information.dart';

try {
      platformVersion = await DeviceInformation.platformVersion;
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      manufacturer = await DeviceInformation.deviceManufacturer;
      apiLevel =  await DeviceInformation.APILevel;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
```
In android add the following permission:
```
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
```
Then for API targetting from Marshmallow, request runtime permissions.
Although in iOS there is no need to specify permissions.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Developer Team:
Hina Hussain & her team members (Kamran Khan, Abdul Sattar, Faiza Farooqui) :smile: :tada:

## License
[MIT](https://choosealicense.com/licenses/mit/)
## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

