import 'package:flutter/material.dart';
import 'package:startupnamer/page/flashchat/component/rounded_button.dart';
import 'package:startupnamer/route/route_generator.dart';
import 'package:startupnamer/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 80.0,),
                  _buildLogo(), // Hero animation widget which has same tag of Welcome screen logo
                  SizedBox(height: 48.0,),
                  _buildEmailField(),
                  SizedBox(height: 8.0,),
                  _buildPasswordField(),
                  SizedBox(height: 24.0,),
                  _buildLoginButton(),
                ],
              ),
            ),
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
        _email = value;
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
        _password = value;
      },
      decoration: kTextFieldDecoration.copyWith(
          hintText: 'Enter your password'
      ),
    );
  }

  Widget _buildLoginButton() {
    return RoundedButton(
      color: Colors.lightBlueAccent,
      title: 'Log In',
      onPress: () async {
        if (_formKey.currentState.validate()) {
          setState(() {
            _showSpinner = true;
          });

          try {
            final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);

            if (user != null) {
              Navigator.of(context).pushNamed(Routes.kChatScreen);
            }

            setState(() {
              _showSpinner = false;
            });
          } catch (e) {
            print(e);
          }
        }
      },
    );
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(regex);
    return value.isNotEmpty && regExp.hasMatch(value);
  }
}
