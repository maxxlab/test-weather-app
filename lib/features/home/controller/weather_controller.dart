import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final weatherControllerProvider =
    StateNotifierProvider<WeatherController, bool>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return WeatherController(weatherRepository: weatherRepository);
});

final getWeatherForecastProvider = FutureProvider.family((ref, String name) async {
  final weatherController = ref.watch(weatherControllerProvider.notifier);
  return weatherController.loadWeather(name: name);
});

class WeatherController extends StateNotifier<bool> {
  final WeatherRepository _weatherRepository;
  WeatherController({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(false);

  Future<Weather> loadWeather({required String name}) async {
    final res = await _weatherRepository.getWeatherForecastByName(name);
    return res;
  }
}
