import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to landing page after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/landing');
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Traffic Violation Reporting System',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
