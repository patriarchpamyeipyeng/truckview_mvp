import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/login.dart'; // Or MainScreen depending on your flow

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Function to wait for 3 seconds, then move to the Login/Home screen
  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    
    // Check if the widget is still mounted in the tree before navigating (best practice)
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Brand Logo Icon Container
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primaryOrange, width: 2),
              ),
              child: const Icon(
                Icons.local_shipping,
                size: 64,
                color: AppTheme.primaryOrange,
              ),
            ),
            const SizedBox(height: 24),
            
            // App Title matching the web platform
            const Text(
              'TRUCK-VIEW',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textWhite,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 8),
            
            const Text(
              'Global Ent. • Abuja',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.primaryOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 48),

            // Loading indicator to show activity while waiting
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: AppTheme.primaryOrange,
                strokeWidth: 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}