import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/apis/weather_api.dart';
import 'package:weather_app/models/weather_model.dart';

final weatherRepositoryProvider = Provider((ref) {
  final weatherApi = ref.watch(weatherApiProvider);
  return WeatherRepository(weatherApi: weatherApi);
});

class WeatherRepository {
  final WeatherApi _weatherApi;

  WeatherRepository({required WeatherApi weatherApi})
      : _weatherApi = weatherApi;

  Future<Weather> getWeatherForecastByName(String name) async {
    final response = await _weatherApi.getWeatherForecastByName(name);
    var jsonData = jsonDecode(response);

    return Weather.fromJson(jsonData);
  }

  Future<Weather> getWeatherForecastByLocation(double lat, double lon) async {
    final response = await _weatherApi.getWeatherForecastByLocation(lat, lon);
    var jsonData = jsonDecode(response);

    return Weather.fromJson(jsonData);
  }
}
