# Device Information

A flutter plugin to get device information such as device IMEI number, model name, API level,CPU Type,Product Name etc for both android & iOS.

## Installation

Add following dependency in pubspec.yaml file:

```bash
device_information:^0.0.3
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
      apiLevel =  await DeviceInformation.apiLevel;
      deviceName = await DeviceInformation.deviceName;
      productName = await DeviceInformation.productName;
      cpuType = await DeviceInformation.cpuName;
      hardware = await DeviceInformation.hardware;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
```
In android add the following permission:
```
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
```
Then for API targetting from Marshmallow, need to request runtime permissions.
Although in iOS there is no need to specify permissions.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Developer Team:
Hina Hussain & her team members (Kamran Khan, Abdul Sattar, Faiza Farooqui) :smile: :tada:

## Follow me
https://hina-hussain-developer.medium.com/creating-publisher-account-on-the-pub-dev-cf86b91cd2f
https://hinahussaindev.blogspot.com/2021/05/creating-publisher-account-on-pubdev.html

## License
[MIT](https://choosealicense.com/licenses/mit/)

