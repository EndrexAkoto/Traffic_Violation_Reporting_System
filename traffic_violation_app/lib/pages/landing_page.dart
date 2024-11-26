import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.traffic, color: Colors.white), // Logo placeholder
            const SizedBox(width: 10),
            const Text('Traffic Violation Reporting System'),
          ],
        ),
        actions: [
          Tooltip(
            message: 'Home',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Home', style: TextStyle(color: Colors.white)),
            ),
          ),
          Tooltip(
            message: 'About Us',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About Us', style: TextStyle(color: Colors.white)),
            ),
          ),
          Tooltip(
            message: 'Contact Us',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/contacts'),
              child: const Text('Contact', style: TextStyle(color: Colors.white)),
            ),
          ),
          Tooltip(
            message: 'Login',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
          Tooltip(
            message: 'Sign Up',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.deepPurple,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome to the Traffic Violation Reporting System',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Report violations quickly and effectively to make our roads safer.',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Features Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Key Features',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureItem(Icons.report, 'Easy Reporting'),
                      _buildFeatureItem(Icons.security, 'Secure Data'),
                      _buildFeatureItem(Icons.map, 'Interactive Maps'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Footer
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/privacy-policy'),
                        child: const Text('Privacy Policy', style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/terms-of-service'),
                        child: const Text('Terms of Service', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '© 2024 Traffic Violation Reporting System. All rights reserved.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.deepPurple),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
