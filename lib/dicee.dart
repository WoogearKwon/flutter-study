import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dicee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {
                },
                child: Image.asset('images/dice1.png'),
              )),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
              },
              child: Image.asset('images/dice1.png'),
            ),
          )
        ],
      ),
    );
  }
}
