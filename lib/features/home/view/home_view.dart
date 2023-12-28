import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/error_page.dart';
import 'package:weather_app/common/loading_page.dart';
import 'package:weather_app/core/providers.dart';
import 'package:weather_app/features/detailed_screen/view/detailed_screen.dart';
import 'package:weather_app/features/home/controller/weather_controller.dart';
import 'package:weather_app/features/home/widgets/locaion_button.dart';
import 'package:weather_app/features/home/widgets/search_bar.dart';
import 'package:weather_app/assets/weather_icons/weather_icons.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final location = ref.watch(locationProvider);

    final nameOrLocationProvider =
        (location.latitude == 0 && location.longitude == 0)
            ? getWeatherForecastNameProvider(
                searchQuery.isEmpty ? 'New York' : searchQuery)
            : getWeatherForecastLocationProvider(location);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: ref.watch(nameOrLocationProvider).when(
            data: (data) {
              return Container(
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SearchBarApp(),
                      const SizedBox(
                        height: 90,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailedScreen(name: data.name),
                            ),
                          );
                        },
                        child: data.id.isNotEmpty
                            ? Card(
                                elevation: 15.5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45.0, vertical: 35),
                                  child: Column(
                                    children: [
                                      Text(
                                        data.name,
                                        style: const TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        'Today',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 118, 118, 118)),
                                      ),
                                      const SizedBox(
                                        height: 46,
                                      ),
                                      Text(
                                        '${data.temp.round().toString()}°C',
                                        style: const TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blue),
                                      ),
                                      const SizedBox(
                                        width: 150,
                                        child: Divider(),
                                      ),
                                      WeatherIconsSet.weatherIcons
                                              .containsKey(data.main)
                                          ? Icon(
                                              WeatherIconsSet
                                                  .weatherIcons[data.main],
                                              size: 44,
                                            )
                                          : Text(
                                              data.main,
                                              style: const TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w300,
                                                color: Color.fromARGB(
                                                    255, 118, 118, 118),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              )
                            : const ErrorText(
                                error: 'Oops, city not found..',
                              ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const LocationButton(),
                    ],
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
