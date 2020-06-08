import 'package:flutter/material.dart';

void main() => runApp(RotationIconApp());

class RotationIconApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Rotation Icon Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'icon rotation',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var position = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title),),
//      body: new Center(child: new Icon(Icons.android)), // Center 안에는 차일드가 하나만 들어갈 수 있음
      body: new Center(child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Slider(value: position, onChanged: (var position) {
            setState(() { // MyHomePageState state 변경을 알고 build 함수 재동작
              this.position = position;
            });
          }),
        new Transform.rotate(angle: position * 2 * 3.14, child: new Icon(Icons.android)),
        new Transform.rotate(angle: position * -2 * 3.14, child: new Icon(Icons.android))
        ],
      )),
    );
  }
}