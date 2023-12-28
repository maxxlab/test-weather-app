import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/assets/weather_icons/weather_icons.dart';
import 'package:weather_app/common/error_page.dart';
import 'package:weather_app/common/loading_page.dart';
import 'package:weather_app/features/home/controller/weather_controller.dart';

class DetailedScreen extends ConsumerWidget {
  final String name;
  const DetailedScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deatailed Screen'),
        centerTitle: true,
      ),
      body: ref.watch(getWeatherForecastNameProvider(name)).when(
            data: (data) {
              return Container(
                padding: const EdgeInsets.all(15.0).copyWith(top: 80),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 15.5,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Today',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 118, 118, 118)),
                          ),
                          const SizedBox(
                            height: 46,
                          ),
                          Text(
                            '${data.temp.round().toString()}°C',
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                          const SizedBox(
                            width: 250,
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'min: ',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 118, 118, 118),
                                ),
                              ),
                              Text(
                                '${data.tempMin.round().toString()}°C',
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 118, 118, 118),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'max: ',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 118, 118, 118),
                                ),
                              ),
                              Text(
                                '${data.tempMax.round().toString()}°C',
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 118, 118, 118),
                                ),
                              ),
                            ],
                          ),
                          WeatherIconsSet.weatherIcons.containsKey(data.main)
                              ? Icon(
                                  WeatherIconsSet.weatherIcons[data.main],
                                  size: 44,
                                  color: Colors.blue,
                                )
                              : Text(
                                  data.main,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 118, 118, 118),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data.description,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  WeatherIconsSet.weatherIcons['wind'],
                                  size: 44,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Text(
                                  '${data.windSpeed.roundToDouble()} m/s',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  WeatherIconsSet.weatherIcons['humidity'],
                                  size: 38,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Text(
                                  '${data.humidity}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            error: (error, st) => const ErrorText(
              error: "Something went wrong..",
            ),
            loading: () => const Loader(),
          ),
    );
  }
}
