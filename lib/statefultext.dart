import 'package:flutter/material.dart';

void main() => runApp(SampleApp());

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key : key);

  @override
  SampleAppPageState createState() => SampleAppPageState();
}

class SampleAppPageState extends State<SampleAppPage> {
  int n = 0;
  String textToShow = "I Like Flutter";

  void updateText() {
    setState(() {
      if (n % 2 == 0) textToShow = "I Like Flutter";
      else textToShow = "Flutter is Awesome!"; // update the text
      n++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample App"),),
      body: Center(child: Text(textToShow),),
      floatingActionButton: FloatingActionButton(
        onPressed: updateText,
        tooltip: "Update Text",
        child: Icon(Icons.update),
      ),
    );
  }
}