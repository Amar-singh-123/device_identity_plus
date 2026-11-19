import Flutter
import UIKit

public class DeviceIdentityPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_identity_plus", binaryMessenger: registrar.messenger())
    let instance = DeviceIdentityPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDeviceId":
      // UIDevice.identifierForVendor:
      // - Survives app updates.
      // - Resets when all apps from the vendor are uninstalled.
      // - Resets on device erase / factory reset.
      let idfv = UIDevice.current.identifierForVendor?.uuidString
      result(idfv)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
