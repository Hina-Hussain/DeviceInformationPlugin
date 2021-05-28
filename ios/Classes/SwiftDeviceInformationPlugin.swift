import Flutter
import UIKit

public class SwiftDeviceInformationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_information", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceInformationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual("getPlatformVersion")){
        result("iOS " + UIDevice.current.systemVersion)
    }
    else if(call.method.elementsEqual("getIMEINumber")){
      let immei = UIDevice.current.identifierForVendor?.uuidString
        result(immei)
    }
    else if(call.method.elementsEqual("getModel")){
        result(UIDevice.current.modelName)
    }
    else if(call.method.elementsEqual("getAPILevel")){
        result(UIDevice.current.systemVersion)
        
    }
    else if(call.method.elementsEqual("getManufacturer")){
        result("Apple")
    }
    else if(call.method.elementsEqual("getDevice")){
     result(UIDevice.current.name)
    }
    else if(call.method.elementsEqual("getProduct")){
        result(UIDevice.current.model)
    }
    else if(call.method.elementsEqual("getCPUType")){
        result(UIDevice.current.getCPUName())
        
    }
    else if(call.method.elementsEqual("getHardware")){
        result(UIDevice.current.systemName)
    }
  }
}
