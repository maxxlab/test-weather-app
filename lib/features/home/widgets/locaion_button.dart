import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/locator.dart';
import 'package:weather_app/core/providers.dart';
import 'package:weather_app/core/utils.dart';

class LocationButton extends ConsumerWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        try {
          ref.read(buttonLoadingProvider.notifier).state = true;

          final letlon = await getLatLon();
          ref.read(locationProvider.notifier).state = letlon;

          ref.read(buttonLoadingProvider.notifier).state = false;
        } catch (e) {
          showSnackBar(context, 'No location was found');
        }
      },
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 23, vertical: 13),
        ),
        elevation: MaterialStatePropertyAll(15.5),
      ),
      child: ref.watch(buttonLoadingProvider)
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text('My Location', style: TextStyle(fontSize: 25)),
    );
  }
}
