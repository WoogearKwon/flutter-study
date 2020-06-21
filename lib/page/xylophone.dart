import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';

/// First of all, we need to add dependency of a open source package called 'audioplayers'.
/// You can see that it's added in [pubspec.yaml] file.
/// Also you can find detailed docs from here: [https://pub.dev/packages/audioplayers]

class Xylophone extends StatelessWidget {
  final player = AudioCache();

  void _playSound(int num) {
    player.play('note$num.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getButton(Colors.red, 1),
              _getButton(Colors.orange, 2),
              _getButton(Colors.yellow, 3),
              _getButton(Colors.lightGreen, 4),
              _getButton(Colors.green, 5),
              _getButton(Colors.blue, 6),
              _getButton(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getButton(MaterialColor color, int num) {
    return Expanded(
      child: FlatButton(
          color: color,
          onPressed: () {
            _playSound(num);
          }
      ),
    );
  }
}