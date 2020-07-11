import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    // LocationAccuracy: more accurate the location you're trying to get, the more battery intensive it will be
    // async keyword gives us access to await keyword which awaits time-consuming work to be done before continuing next line of code
    // make sure that your device's GPS is on
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  // initState() only gets called once at the state gets initialized gets created.
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  // build() gets called when widgets gets build onto the screen,
  // and gets called every single time that the widgets rebuild.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
