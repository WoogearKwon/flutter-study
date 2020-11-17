import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// We are going to get battery level from each platform, Android and iOS.
class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  // All channel names used in a single app must be unique
  static const batteryPlatform = const MethodChannel('samples.flutter.dev/battery');

  // Get the battery level.
  String _batteryLevel = 'Unknown battery level.';
  String _platformName = 'Unknown platform';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: () {
                _getBatteryLevel();
                _getPlatformName();
              },
            ),
            Column(
              children: [
                Text(
                  _batteryLevel,
                  style: TextStyle(
                      fontSize: 30
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    _platformName,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;

    try {
      final int result = await batteryPlatform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level: ${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _getPlatformName() async {
    String platformName;

    try {
      final String result = await batteryPlatform.invokeMethod('getPlatformName');
      platformName = 'This is $result platform.';
    } on PlatformException catch (e) {
      platformName = 'Failed to get platform name: ${e.message}';
    }

    setState(() {
      _platformName = platformName;
    });
  }
}
