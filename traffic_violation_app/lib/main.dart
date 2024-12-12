import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'pages/login_screen.dart';
import 'pages/signup_screen.dart';
import 'pages/privacy_policy_page.dart';
import 'pages/terms_of_service_page.dart';
import 'pages/about_page.dart';
import 'pages/contacts_page.dart';
import 'pages/splash_screen.dart';
import 'pages/profile_screen.dart';
import 'pages/edit_profile_screen.dart';
import 'pages/reported_cases_page.dart';
import 'pages/unsolved_cases_page.dart';
import 'pages/solved_cases_page.dart';
import 'pages/case_details_page.dart';
import 'pages/user_dashboard.dart'; // Import the UserDashboard page
import 'pages/admin/landing_page.dart';
import 'pages/admin/login_screen.dart';
import 'pages/admin/signup_screen.dart';

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
        '/': (context) => const SplashScreen(),
        '/landing': (context) => const LandingPage(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(), // User SignUpScreen
        '/privacy-policy': (context) => const PrivacyPolicyPage(),
        '/terms-of-service': (context) => const TermsOfServicePage(),
        '/about': (context) => const AboutPage(),
        '/contacts': (context) => const ContactsPage(),
        '/profile': (context) => const ProfileScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/reported-cases': (context) => const ReportedCasesPage(),
        '/unsolved-cases': (context) => const UnsolvedCasesPage(),
        '/solved-cases': (context) => const SolvedCasesPage(),
        '/case-details': (context) => const CaseDetailsPage(),
        '/dashboard': (context) => const UserDashboard(), // Add this route
        '/admin-landing': (context) => const AdminLandingPage(),
        '/admin-login': (context) => const AdminLoginScreen(),
        '/admin-signup': (context) =>
            const AdminSignUpScreen(), // Admin SignUpScreen
      },
    );
  }
}
