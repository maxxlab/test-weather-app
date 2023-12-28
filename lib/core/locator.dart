import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/location_model.dart';

Future<LocationPermission> checkLocationPermission() async {
  return await Geolocator.checkPermission();
}

Future<LocationPermission> requestLocationPermission() async {
  return await Geolocator.requestPermission();
}

Future<Position> getCurrentLocation() async {
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
}


Future<Location> getLatLon() async {
  Position position = await getCurrentLocation();
  double latitude = position.latitude;
  double longitude = position.longitude;

  return Location(latitude: latitude, longitude: longitude);
}

