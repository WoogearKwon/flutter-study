package com.example.startupnamer

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL_BATTERY = "samples.flutter.dev/battery"
    private val CHANNEL_NAME = "samples.flutter.dev/name"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_BATTERY).setMethodCallHandler {
            //Note: this method is invoked on the main thread.
            call, result ->

            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }

            } else if (call.method == "getPlatformName") {
                result.success("Android")

            } else {
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME).setMethodCallHandler {
            call, result ->
            if (call.method == "getPlatformName") {
                result.success("Android")
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        batteryLevel = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext)
                    .registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))

            val batteryValue = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100
            val batteryScale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)

            batteryValue / batteryScale
        }

        return batteryLevel
    }
}
