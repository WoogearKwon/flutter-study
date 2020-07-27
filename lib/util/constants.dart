import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);

const kLabelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98)
);

const kNumberTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
    color: Colors.white
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kBodyTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  color: Colors.white
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
  color: Colors.white
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none,
    )
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);