import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_identity_plus_method_channel.dart';

abstract class DeviceIdentityPlusPlatform extends PlatformInterface {
  /// Constructs a DeviceIdentityPlusPlatform.
  DeviceIdentityPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceIdentityPlusPlatform _instance = MethodChannelDeviceIdentityPlus();

  /// The default instance of [DeviceIdentityPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceIdentityPlus].
  static DeviceIdentityPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceIdentityPlusPlatform] when
  /// they register themselves.
  static set instance(DeviceIdentityPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the persistent unique device identifier:
  /// - Android: Settings.Secure.ANDROID_ID
  /// - iOS: UIDevice.current.identifierForVendor (IDFV)
  Future<String?> getDeviceId() {
    throw UnimplementedError('getDeviceId() has not been implemented.');
  }
}
