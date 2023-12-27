import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/error_page.dart';
import 'package:weather_app/common/loading_page.dart';
import 'package:weather_app/features/home/controller/weather_controller.dart';
import 'package:weather_app/models/weather_model.dart';

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
    final isLoading = ref.watch(weatherControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: ref.watch(getWeatherForecastProvider('Lviv')).when(
            data: (data) {
              return Center(
                child: Text(data.description),
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
