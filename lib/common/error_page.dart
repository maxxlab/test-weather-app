import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          error,
          textAlign: TextAlign.center,
          style: const  TextStyle(
              fontSize: 42, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 211, 81, 72)),
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorText(error: error),
    );
  }
}
