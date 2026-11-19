## 0.0.1

* Initial release.
* Adds support for retrieving native persistent unique device identifiers:
  * Android: `Settings.Secure.ANDROID_ID`
  * iOS: `UIDevice.current.identifierForVendor` (IDFV)
* Zero external dependencies.
* Safe across app updates.
