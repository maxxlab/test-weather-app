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
    if (response.isNotEmpty) {
      var jsonData = jsonDecode(response);
      // final weatherJson = jsonData['articles'];
      Weather weather = Weather.fromJson(jsonData);
      return weather;
    } else {
      print('Data is empty');
      return Weather(
          id: 'id',
          name: name,
          main: 'main',
          description: 'description',
          temp: 0,
          feelsLike: 0,
          tempMin: 0,
          tempMax: 0,
          pressure: 0,
          windSpeed: 0);
    }
  }
}
