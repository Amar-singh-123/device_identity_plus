import 'device_identity_plus_platform_interface.dart';

/// A Flutter plugin to retrieve native persistent unique device identifiers
/// across Android and iOS.
///
/// - **Android**: Returns `Settings.Secure.ANDROID_ID`.
/// - **iOS**: Returns `UIDevice.current.identifierForVendor` (IDFV).
///
/// **Lifecycle Behavior**:
/// - **Survives App Updates**: Does NOT change or reset when updating the app.
/// - **Survives Reboots & Restarts**: Does NOT change on reboot or app restart.
/// - **Reset conditions**:
///   - iOS: Resets when all apps from the vendor are uninstalled.
///   - Android: Resets on Factory Reset / Phone Erase.
/// - **Store Compliant**: Requires NO special or dangerous permissions.
class DeviceIdentityPlus {
  /// Returns the persistent native device unique identifier.
  Future<String?> getDeviceId() {
    return DeviceIdentityPlusPlatform.instance.getDeviceId();
  }
}
