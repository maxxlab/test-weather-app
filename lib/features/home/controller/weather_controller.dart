import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/location_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final weatherControllerProvider =
    StateNotifierProvider<WeatherController, bool>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return WeatherController(weatherRepository: weatherRepository);
});



final getWeatherForecastNameProvider =
    FutureProvider.family((ref, String name) async {
  final weatherController = ref.watch(weatherControllerProvider.notifier);
  return weatherController.loadWeatherByName(name: name);
});

final getWeatherForecastLocationProvider =
    FutureProvider.family((ref, Location location) async {
  final weatherController = ref.watch(weatherControllerProvider.notifier);
  return weatherController.loadWeatherByLocation(
      lat: location.latitude, lon: location.longitude);
});

class WeatherController extends StateNotifier<bool> {
  final WeatherRepository _weatherRepository;
  WeatherController({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(false);

  Future<Weather> loadWeatherByName({required String name}) async {
    final res = await _weatherRepository.getWeatherForecastByName(name);
    return res;
  }

  Future<Weather> loadWeatherByLocation(
      {required double lat, required double lon}) async {
    final res = await _weatherRepository.getWeatherForecastByLocation(lat, lon);
    return res;
  }
}
