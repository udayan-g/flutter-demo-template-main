package com.example.demo.utils

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class WifiUtilsPlugin : FlutterPlugin {

    private lateinit var channel: MethodChannel
    private lateinit var wifiUtils: WifiUtils

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wifi_utils_channel")
        channel.setMethodCallHandler(this)
        wifiUtils = WifiUtils(flutterPluginBinding.applicationContext)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "connectToWifi" -> {
                val ssid = call.argument<String>("ssid")
                val password = call.argument<String>("password")
                if (ssid != null && password != null) {
                    val isConnected = wifiUtils.connectToWifi(ssid, password)
                    result.success(isConnected)
                } else {
                    result.error("MISSING_PARAMETERS", "SSID or password missing", null)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
