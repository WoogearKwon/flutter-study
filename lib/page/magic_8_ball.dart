import 'package:flutter/material.dart';
import 'dart:math';

class MagicEightBall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Ask Me Anything'),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          _updateBallNumber();
        },
        child: Image.asset('images/ball${ballNumber + 1}.png'),
      ),
    );
  }

  void _updateBallNumber() {
    setState(() {
      ballNumber = Random().nextInt(5);
    });
  }
}
