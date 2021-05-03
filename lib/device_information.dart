
import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInformation {
  static const MethodChannel _channel = const MethodChannel('device_information');

  // Future method to get android version of the device
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
// Future method to get unique number of device
  static Future<String> get deviceIMEINumber async{
    return await _channel.invokeMethod("getIMEINumber");
  }
// Future method to get api level of the device
  static Future<dynamic> get apiLevel async{
    return await _channel.invokeMethod("getAPILevel");
  }
// Future method to get device model
  static Future<String> get deviceModel async{
    return await _channel.invokeMethod("getModel");
  }
// Future method to get manufacturer of the device
  static Future<String> get deviceManufacturer async{
    return await _channel.invokeMethod("getManufacturer");
  }

  // Future method to get device name of the device
  static Future<String> get deviceName async{
    return await _channel.invokeMethod("getDevice");
  }

  // Future method to get product name of the device
  static Future<String> get productName async{
    return await _channel.invokeMethod("getProduct");
  }

  // Future method to get CPU name of the device
  static Future<String> get cpuName async{
    return await _channel.invokeMethod("getCPUType");
  }

  // Future method to get hardware of the device
  static Future<String> get hardware async{
    return await _channel.invokeMethod("getHardware");
  }
}
