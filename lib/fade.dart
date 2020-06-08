import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(FadeAppTest());

class FadeAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(primarySwatch:Colors.blue),
      home: MyFadeTest(title: 'Fade Demo',),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  final String title;
  MyFadeTest({Key key, this.title}) : super (key : key);
  @override
  _MyFadeTest createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Container(
          child: FadeTransition(opacity: curve, child: FlutterLogo(size: 100.0,),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}