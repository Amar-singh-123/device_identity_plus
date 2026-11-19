# device_identity_plus

[![pub package](https://img.shields.io/pub/v/device_identity_plus.svg)](https://pub.dev/packages/device_identity_plus)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A lightweight, privacy-friendly Flutter plugin to retrieve native persistent unique device identifiers across Android and iOS.

---

## Features

- **Persistent Across Updates**: The unique identifier does not change when the app is updated.
- **Privacy-First**: Complies with Apple App Store and Google Play policies.
- **Zero Permissions Required**: No runtime permission prompts, no App Tracking Transparency (ATT) requests, and no telephony state access needed.
- **Zero Third-Party Dependencies**: Built purely with native platform channels.
- **Fast & Reliable**: Directly queries native OS APIs.

---

## Platform Support

| Platform | Supported | Native API Used | Minimum OS Version |
| :--- | :---: | :--- | :--- |
| **Android** | ✅ | `Settings.Secure.ANDROID_ID` | Android 4.1 (API 16)+ |
| **iOS** | ✅ | `UIDevice.current.identifierForVendor` (IDFV) | iOS 12.0+ |

---

## Use Cases

- **Device-Bound Authentication**: Seamless guest or quick-login mechanisms.
- **Device Management**: Managing active devices connected to user accounts.
- **Licensing & Fraud Prevention**: Preventing multi-device abuse while respecting user privacy.
- **Analytics & Telemetry**: Consistent anonymous device-level metrics across sessions.

---

## Installation

Add `device_identity_plus` to your `pubspec.yaml`:

```yaml
dependencies:
  device_identity_plus: ^1.1.1
```

Or run:

```bash
flutter pub add device_identity_plus
```

---

## Usage

### Basic Example

```dart
import 'package:device_identity_plus/device_identity_plus.dart';

Future<void> fetchDeviceId() async {
  final deviceIdentity = DeviceIdentityPlus();

  try {
    final String? deviceId = await deviceIdentity.getDeviceId();
    print('Device ID: $deviceId');
  } catch (e) {
    print('Failed to get device ID: $e');
  }
}
```

### With Error Handling & Null Safety

```dart
import 'package:flutter/services.dart';
import 'package:device_identity_plus/device_identity_plus.dart';

class DeviceIdHelper {
  static final DeviceIdentityPlus _plugin = DeviceIdentityPlus();

  static Future<String> getUniqueId() async {
    try {
      final String? id = await _plugin.getDeviceId();
      return id ?? 'UNKNOWN_DEVICE_ID';
    } on PlatformException catch (e) {
      return 'ERROR_${e.code}';
    } catch (e) {
      return 'UNKNOWN_ERROR';
    }
  }
}
```

---

## Identifier Lifecycle & Persistence

| Event | Android (`ANDROID_ID`) | iOS (`IDFV`) |
| :--- | :--- | :--- |
| **App Update** | ✅ **Persists** (Remains identical) | ✅ **Persists** (Remains identical) |
| **App Restart / Reboot** | ✅ **Persists** | ✅ **Persists** |
| **App Uninstall & Reinstall** | ✅ **Persists** (Tied to app signing key + user) | 🔄 **Resets** (If all vendor apps are uninstalled) |
| **Device Factory Reset / Erase** | 🔄 **Resets** | 🔄 **Resets** |

---

## Privacy & Store Compliance

- **Google Play**: Google prohibits accessing non-resettable hardware IDs (such as IMEI or MAC address) for regular apps. `ANDROID_ID` is scoped to the app signing key and is the recommended identifier for app-level device identification.
- **Apple App Store**: Apple forbids device fingerprinting and hardware MAC/IMEI access. `identifierForVendor` (IDFV) is Apple's official sanctioned identifier for vendor apps and does **not** require user tracking consent under App Tracking Transparency (ATT).

---

## Contributing & Issues

Contributions, feature suggestions, and bug reports are welcome! Please feel free to open an issue or pull request on [GitHub](https://github.com/Amar-singh-123/device_identity_plus).

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
