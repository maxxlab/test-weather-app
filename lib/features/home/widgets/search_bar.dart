import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/cities_list.dart';
import 'package:weather_app/core/providers.dart';
import 'package:weather_app/features/home/controller/weather_controller.dart';
import 'package:weather_app/models/location_model.dart';

class SearchBarApp extends ConsumerStatefulWidget {
  const SearchBarApp({super.key});

  @override
  ConsumerState<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends ConsumerState<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      viewHintText: 'Enter the city',
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          hintText: 'Enter the city',
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          onSubmitted: (text) {
            ref.read(searchQueryProvider.notifier).state = text;
            ref.read(locationProvider.notifier).state = Location(latitude: 0, longitude: 0);
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return generateRandomCities().map(
          (city) => ListTile(
            title: Text(city),
            onTap: () {
              setState(() {
                controller.closeView(city);
              });
            },
          ),
        );
      },
    );
  }
}
