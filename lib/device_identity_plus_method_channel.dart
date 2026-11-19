import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_identity_plus_platform_interface.dart';

/// An implementation of [DeviceIdentityPlusPlatform] that uses method channels.
class MethodChannelDeviceIdentityPlus extends DeviceIdentityPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_identity_plus');

  @override
  Future<String?> getDeviceId() async {
    final deviceId = await methodChannel.invokeMethod<String>('getDeviceId');
    return deviceId;
  }
}
