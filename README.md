# device_identity_plus

A lightweight Flutter plugin to retrieve native persistent unique device identifiers across Android and iOS.

Designed specifically for **Guest/Quick Login**, device licensing, and fraud prevention where the device identifier:
- **Must NOT change across app updates** (e.g. updating v1.0.0 to v2.0.0).
- **Must NOT change on app restart or device reboot**.
- **Can only reset on app uninstall (iOS) or device erase / factory reset**.
- **Requires ZERO runtime permissions** (No ATT tracking or phone state permissions).

---

## Native Identifiers Used

| Platform | Native Identifier | Behavior on App Update | Behavior on Uninstall |
| :--- | :--- | :---: | :---: |
| **Android** | `Settings.Secure.ANDROID_ID` | **Persists** (Identical) | Preserved across reinstalls with same signing key; resets on factory reset |
| **iOS** | `UIDevice.current.identifierForVendor` (IDFV) | **Persists** (Identical) | **Resets** when all apps of this vendor are removed |

---

## Installation

Add `device_identity_plus` to your `pubspec.yaml`:

```yaml
dependencies:
  device_identity_plus: ^0.0.1
```

Or run:

```bash
flutter pub add device_identity_plus
```

---

## Usage

```dart
import 'package:device_identity_plus/device_identity_plus.dart';

final deviceIdentity = DeviceIdentityPlus();

// Retrieve the unique device ID:
String? deviceId = await deviceIdentity.getDeviceId();
print('Device ID: $deviceId');
```

---

## Quick / Guest Login Example

```dart
Future<void> performQuickLogin() async {
  final deviceIdentity = DeviceIdentityPlus();
  final deviceId = await deviceIdentity.getDeviceId();

  if (deviceId != null) {
    // Authenticate with your backend using this persistent device ID
    final response = await myAuthApi.loginWithDeviceId(deviceId);
    print('Logged in as guest account bound to $deviceId');
  }
}
```

---

## License

MIT License.
