import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/location_model.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final locationProvider = StateProvider<Location>(
  (ref) => Location(
    latitude: 0,
    longitude: 0,
  ),
);

final buttonLoadingProvider = StateProvider<bool>((ref) => false);
