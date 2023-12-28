import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/view/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 42, 109, 169)),
          useMaterial3: true,
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          )),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
