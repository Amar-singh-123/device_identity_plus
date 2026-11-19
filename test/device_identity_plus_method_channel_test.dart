import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_identity_plus/device_identity_plus_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDeviceIdentityPlus platform = MethodChannelDeviceIdentityPlus();
  const MethodChannel channel = MethodChannel('device_identity_plus');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'getDeviceId') {
            return 'mock-device-id-12345';
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getDeviceId', () async {
    expect(await platform.getDeviceId(), 'mock-device-id-12345');
  });
}
