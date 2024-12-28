package com.nairda.device_name

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.os.Build
import android.provider.Settings
import android.content.Context

/** DeviceNamePlugin */
class DeviceNamePlugin : FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  private lateinit var channel: MethodChannel
  private lateinit var context: Context // Variable para almacenar el contexto

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.nairda/device_name")
    channel.setMethodCallHandler(this)

    // Guarda el contexto desde FlutterPluginBinding
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getDeviceName") {
      // Usa el contentResolver desde el contexto
      val deviceName = Settings.Global.getString(context.contentResolver, Settings.Global.DEVICE_NAME)
              ?: "${Build.MODEL}" // Valor por defecto si no hay un nombre de dispositivo
      result.success(deviceName)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
