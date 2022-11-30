import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherly/view.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(const Weatherly());
}

class Weatherly extends StatelessWidget {
  const Weatherly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
