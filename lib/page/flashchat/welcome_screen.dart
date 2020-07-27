import 'package:flutter/material.dart';
import 'package:startupnamer/page/flashchat/component/rounded_button.dart';
import 'package:startupnamer/route/route_generator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

/// note: we add SingleTickerProviderStateMixin with the 'with' keyword.
/// We can use multiple mixins to add a capabilities.
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1), // makes animation work in 1 second
      vsync: this,
//      upperBound: 100 // default value is 1.0 if you wouldn't specify it
    );

    /// to add a curve effect on our animation
    /// check here [https://api.flutter.dev/flutter/animation/Curves-class.html] to find more animation curves
//    animation = CurvedAnimation(
//      parent: controller,
//      curve: Curves.decelerate, // decelerate speed
//    );

    /// see how easy to implement animation in flutter!
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white
    ).animate(controller);

    controller.forward(); // starts animation forwards

    controller.addListener(() { // controller.value changes 0.0 to 100.0 for 1 second
      setState(() { // updates UI when gets new value
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Hero animation widget which has same tag of login screen and registration screen.
                // It makes the logo to move to the center with its increasing size.
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo_flash_chat.png'),
//                    height: animation.value * 100,
                    height: 60.0,
                  ),
                ),
                /// check docs: [https://pub.dev/packages/animated_text_kit]
                /// makes texts to be animated like type writing
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 500),
                  totalRepeatCount: 2,
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log in',
              onPress: () {
                //Go to login screen.
                Navigator.of(context).pushNamed(Routes.kChatLogin);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPress: () {
                //Go to registration screen.
                Navigator.of(context).pushNamed(Routes.kChatRegistration);
              },
            ),
          ],
        ),
      ),
    );
  }
}
