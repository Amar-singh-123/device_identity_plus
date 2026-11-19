package com.example.device_identity_plus

import android.content.Context
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DeviceIdentityPlusPlugin */
class DeviceIdentityPlusPlugin :
    FlutterPlugin,
    MethodCallHandler {

    private lateinit var channel: MethodChannel
    private var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_identity_plus")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        if (call.method == "getDeviceId") {
            val contentResolver = context?.contentResolver
            if (contentResolver != null) {
                // Settings.Secure.ANDROID_ID:
                // Scoped to (device + app signing key + user profile).
                // Survives app updates and reboots.
                val androidId: String? = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
                result.success(androidId)
            } else {
                result.error("UNAVAILABLE", "Context contentResolver is null", null)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        context = null
    }
}
