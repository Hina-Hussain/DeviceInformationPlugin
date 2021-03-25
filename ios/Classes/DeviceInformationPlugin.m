#import "DeviceInformationPlugin.h"
#if __has_include(<device_information/device_information-Swift.h>)
#import <device_information/device_information-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_information-Swift.h"
#endif

@implementation DeviceInformationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceInformationPlugin registerWithRegistrar:registrar];
}
@end
