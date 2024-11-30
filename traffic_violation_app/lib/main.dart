import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'pages/login_screen.dart';
import 'pages/signup_screen.dart';
import 'pages/privacy_policy_page.dart';
import 'pages/terms_of_service_page.dart';
import 'pages/about_page.dart';
import 'pages/contacts_page.dart';
import 'pages/splash_screen.dart'; // Import the SplashScreen
import 'pages/profile_screen.dart'; // Import the ProfileScreen
import 'pages/edit_profile_screen.dart'; // Import the EditProfileScreen
import 'pages/reported_cases_page.dart'; // Import the ReportedCasesPage
import 'pages/unsolved_cases_page.dart'; // Import the UnsolvedCasesPage
import 'pages/solved_cases_page.dart'; // Import the SolvedCasesPage
import 'pages/case_details_page.dart'; // Import the CaseDetailsPage
import 'pages/admin/landing_page.dart';
import 'pages/admin/login_screen.dart';
import 'pages/admin/signup_screen.dart';
import 'pages/admin/admin_dashboard.dart';
import 'pages/admin/admin_settings_page.dart';
import 'pages/admin/edit_user_page.dart';
import 'pages/admin/login_screen.dart';
import 'pages/admin/signup_screen.dart';

import 'dart:async'; // For the delay

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Violation Reporting System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // This will first show the SplashScreen
      routes: {
        '/': (context) => const SplashScreen(), // SplashScreen route
        '/landing': (context) => const LandingPage(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/privacy-policy': (context) => const PrivacyPolicyPage(),
        '/terms-of-service': (context) => const TermsOfServicePage(),
        '/about': (context) => const AboutPage(),
        '/contacts': (context) => const ContactsPage(),
        '/profile': (context) => const ProfileScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/reported-cases': (context) =>
            const ReportedCasesPage(), // Reported Cases
        '/unsolved-cases': (context) =>
            const UnsolvedCasesPage(), // Unsolved Cases
        '/solved-cases': (context) => const SolvedCasesPage(), // Solved Cases
        '/case-details': (context) => const CaseDetailsPage(), // Case Details
        '/admin-landing': (context) => const AdminLandingPage(),
        '/admin-login': (context) => const AdminLoginScreen(),
        '/admin-signup': (context) => const AdminSignUpScreen(),

      },
    );
  }
}
