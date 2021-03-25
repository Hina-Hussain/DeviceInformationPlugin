
import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInformation {
  static const MethodChannel _channel =
      const MethodChannel('device_information');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get deviceIMEINumber async{
    return await _channel.invokeMethod("getIMEINumber");
  }

  static Future<int> get APILevel async{
    return await _channel.invokeMethod("getAPILevel");
  }

  static Future<String> get deviceModel async{
    return await _channel.invokeMethod("getModel");
  }

  static Future<String> get deviceManufacturer async{
    return await _channel.invokeMethod("getManufacturer");
  }
}
