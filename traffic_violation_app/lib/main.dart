import 'package:flutter/material.dart';
import 'report_violation_screen.dart'; // Ensure this exists in 'lib/'
import 'pages/landing_page.dart'; // Ensure this exists in 'lib/pages'
import 'widgets/dashboard_summary.dart'; // Ensure this exists in 'lib/widgets'
import 'widgets/sidebar.dart'; // Ensure this exists in 'lib/widgets'
import 'services/api_service.dart'; // Ensure this exists in 'lib/services'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Violation Reporting',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(), // Change this to LandingPage
    );
  }
}
