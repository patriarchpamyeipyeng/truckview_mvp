import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/splash.dart'; // Or start with MainScreen / Splash

void main() {
  // Ensures Flutter bindings are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TruckViewApp());
}

class TruckViewApp extends StatelessWidget {
  const TruckViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truck-View Global Ent.',
      debugShowCheckedModeBanner: false, // Hides the debug banner in the corner
      
      // Applying the custom dark theme we defined in app_theme.dart
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Enforces dark mode globally matching your web app
      
      // The starting screen of your application (usually a splash screen or main wrapper)
      home: const SplashPage(),
    );
  }
}