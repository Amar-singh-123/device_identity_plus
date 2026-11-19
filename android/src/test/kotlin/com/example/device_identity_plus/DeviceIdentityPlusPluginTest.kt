package com.example.device_identity_plus

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.mockito.Mockito
import kotlin.test.Test

internal class DeviceIdentityPlusPluginTest {
    @Test
    fun onMethodCall_unknownMethod_callsNotImplemented() {
        val plugin = DeviceIdentityPlusPlugin()

        val call = MethodCall("unknownMethod", null)
        val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
        plugin.onMethodCall(call, mockResult)

        Mockito.verify(mockResult).notImplemented()
    }
}
