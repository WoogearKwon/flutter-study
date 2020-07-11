import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    // LocationAccuracy: more accurate the location you're trying to get, the more battery intensive it will be
    // async keyword gives us access to await keyword which awaits time-consuming work to be done before continuing next line of code
    // make sure that your device's GPS is on
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print(e);
    }
  }
}