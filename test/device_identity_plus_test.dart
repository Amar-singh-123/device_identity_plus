import 'package:flutter_test/flutter_test.dart';
import 'package:device_identity_plus/device_identity_plus.dart';
import 'package:device_identity_plus/device_identity_plus_platform_interface.dart';
import 'package:device_identity_plus/device_identity_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceIdentityPlusPlatform
    with MockPlatformInterfaceMixin
    implements DeviceIdentityPlusPlatform {
  @override
  Future<String?> getDeviceId() => Future.value('mock-device-id-12345');
}

void main() {
  final DeviceIdentityPlusPlatform initialPlatform = DeviceIdentityPlusPlatform.instance;

  test('$MethodChannelDeviceIdentityPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceIdentityPlus>());
  });

  test('getDeviceId', () async {
    DeviceIdentityPlus deviceIdentityPlusPlugin = DeviceIdentityPlus();
    MockDeviceIdentityPlusPlatform fakePlatform = MockDeviceIdentityPlusPlatform();
    DeviceIdentityPlusPlatform.instance = fakePlatform;

    expect(await deviceIdentityPlusPlugin.getDeviceId(), 'mock-device-id-12345');
  });
}
