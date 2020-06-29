import 'package:flutter/material.dart';
import 'input_page.dart';

/// separate app into two distinct pages for Theme and UI
class Skeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // you can customize the app theme here
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}