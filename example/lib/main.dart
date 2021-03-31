import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_information/device_information.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown',_imeiNo = "",_modelName = "",
  _manufacturerName = "";
  int _apiLevel =0;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion,imeiNo,modelName,manufacturer;
    int apiLevel;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await DeviceInformation.platformVersion;
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      manufacturer = await DeviceInformation.deviceManufacturer;
      apiLevel =  await DeviceInformation.APILevel;
    } on PlatformException catch(e) {
      platformVersion = '${e.message}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = "Running on :$platformVersion";
      _imeiNo = imeiNo;
      _modelName = modelName;
      _manufacturerName = manufacturer;
      _apiLevel = apiLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('$_platformVersion\n'),
              SizedBox(height: 10,),
              Text('IMEI Number: $_imeiNo\n'),
              SizedBox(height: 10,),
              Text('Device Model: $_modelName\n'),
              SizedBox(height: 10,),
              Text('API Level: $_apiLevel\n'),
              SizedBox(height: 10,),
              Text('Manufacture Name: $_manufacturerName\n'),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
