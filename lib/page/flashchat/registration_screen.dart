import 'package:flutter/material.dart';
import 'package:startupnamer/page/flashchat/chat_screen.dart';
import 'package:startupnamer/page/flashchat/component/rounded_button.dart';
import 'package:startupnamer/route/route_generator.dart';
import 'package:startupnamer/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = new GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Hero animation widget which has same tag of Welcome screen logo
              _buildLogo(),
              SizedBox(height: 48.0,),
              _buildEmailField(),
              SizedBox(height: 8.0,),
              _buildPasswordField(),
              SizedBox(height: 24.0,),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Hero(
      tag: 'logo',
      child: Container(
        height: 200.0,
        child: Image.asset('images/logo_flash_chat.png'),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      validator: (value) => !isEmail(value) ? 'Cannot recognize this email address' : null,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        email = value;
      },
      decoration: kTextFieldDecoration.copyWith(
          hintText: 'Enter your email'
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      validator: (value) => value.length <= 6 ? 'Password must be 6 or more characters' : null,
      textAlign: TextAlign.center,
      obscureText: true,
      onChanged: (value) {
        password = value;
      },
      decoration: kTextFieldDecoration.copyWith(
          hintText: 'Enter your password'
      ),
    );
  }

  Widget _buildRegisterButton() {
    return RoundedButton(
      color: Colors.blueAccent,
      title: 'Register',
      onPress: () async {
        if (_formKey.currentState.validate()) {
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: email, password: password);
            if (newUser != null) {
              Navigator.of(context).pushNamed(Routes.kChatScreen);
            }
          } catch (e) {
            print(e);
          }
        }
      }
    );
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(regex);
    return value.isNotEmpty && regExp.hasMatch(value);
  }
}
