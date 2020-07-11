import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

// you can get your own api key from here: https://home.openweathermap.org/
const apiKey = 'fb4673cd5fa5a71484fabd0b64b30dea';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  // initState() only gets called once at the state gets initialized gets created.
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    // request data with your latitude,longitude and apiKey
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,daily&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  // build() gets called when widgets gets build onto the screen,
  // and gets called every single time that the widgets rebuild.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Center(
      ),
    );
  }
}
