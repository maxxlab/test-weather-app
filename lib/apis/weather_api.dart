import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/weather_app_constants.dart';

final weatherApiProvider = Provider((ref) {
  return WeatherApi();
});

abstract class IWeatherApi {
  Future<String> getWeatherForecastByName(String name);
}

class WeatherApi implements IWeatherApi {
  @override
  Future<String> getWeatherForecastByName(String name) async {
    final response = await http.get(
      Uri.parse(
        WeatherAppConstants.cityForecast(name),
      ),
    );

    switch (response.statusCode) {
      case 200:
        print('HTTP Status: ${response.statusCode}');
        return response.body;
      default:
        print('HTTP Status: ${response.statusCode}');
    }

    return '';
  }
}
