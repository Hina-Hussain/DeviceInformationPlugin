import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInformation {
  static const MethodChannel _channel =
      const MethodChannel('device_information');

  // Future method to get android version of the device
  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('getPlatformVersion');
    return version == null ? "" : version;
  }

// Future method to get unique number of device
  static Future<String> get deviceIMEINumber async {
    final imeiNo = await _channel.invokeMethod("getIMEINumber");
    return imeiNo == null ? "" : imeiNo;
  }

// Future method to get api level of the device
  static Future<dynamic> get apiLevel async {
    final apiLevel = await _channel.invokeMethod("getAPILevel");
    return apiLevel == null ? "" : apiLevel;
  }

// Future method to get device model
  static Future<String> get deviceModel async {
    final model = await _channel.invokeMethod("getModel");
    return model == null ? "" : model;
  }

// Future method to get manufacturer of the device
  static Future<String> get deviceManufacturer async {
    final deviceManufacturer = await _channel.invokeMethod("getManufacturer");
    return deviceManufacturer == null ? "" : deviceManufacturer;
  }

  // Future method to get device name of the device
  static Future<String> get deviceName async {
    final deviceName = await _channel.invokeMethod("getDevice");
    return deviceName == null ? "" : deviceName;
  }

  // Future method to get product name of the device
  static Future<String> get productName async {
    final productName = await _channel.invokeMethod("getProduct");
    return productName == null ? "" : productName;
  }

  // Future method to get CPU name of the device
  static Future<String> get cpuName async {
    final cpuName = await _channel.invokeMethod("getCPUType");
    return cpuName == null ? "" : cpuName;
  }

  // Future method to get hardware of the device
  static Future<String> get hardware async {
    final hardware = await _channel.invokeMethod("getHardware");
    return hardware == null ? "" : hardware;
  }
}
