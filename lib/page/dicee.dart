import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// In this part we will learn how to use Stateful Widget,
/// which saves the states so you can update the screen from it.
class Dicee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    );
  }
}

/// widget part
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

/// state part which will track and update the screen as the state changes
class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // made this function to remove repeated codes
  void _updateDiceNumbers() {
    /// setState() trigger a re-build, so that screen will show the updated data
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {
                  _updateDiceNumbers();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              )),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                _updateDiceNumbers();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          )
        ],
      ),
    );
  }
}
