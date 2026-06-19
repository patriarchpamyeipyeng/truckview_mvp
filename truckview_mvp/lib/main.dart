import 'package:flutter/material.dart';
import 'pages/splash.dart';

void main() {
  runApp(const TruckViewApp());
}

class TruckViewApp extends StatelessWidget {
  const TruckViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}