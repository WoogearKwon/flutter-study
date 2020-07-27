import 'package:flutter/material.dart';
import 'package:startupnamer/page/flashchat/component/rounded_button.dart';
import 'package:startupnamer/util/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Hero animation widget which has same tag of Welcome screen logo
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo_flash_chat.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email'
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPress: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
