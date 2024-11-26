import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.traffic, color: Color.fromARGB(255, 82, 209, 9)), // Logo placeholder
            const SizedBox(width: 50),
            const Text('Traffic Violation Reporting System'),
          ],
        ),
        actions: [
          Tooltip(
            message: 'Home',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Home', style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'About Us',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About Us', style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'Contact Us',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/contacts'),
              child: const Text('Contact', style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'Login',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Login', style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'Sign Up',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign Up', style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          // Add Profile Picture Here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                // Handle profile tap, e.g., navigate to Profile Screen
                Navigator.pushNamed(context, '/profile');
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/dp.jpg'), // Path to the image
              ),
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
            // Key Features Section
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
            // Road Safety Awareness Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Road Safety Awareness',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Learn important tips and information about road safety to keep yourself and others safe on the road.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  _buildSafetyCard(
                    'assets/images/dp.jpg',
                    'Safety Tips for Drivers',
                    'Stay alert, follow traffic rules, and drive defensively to ensure everyone’s safety on the road.',
                  ),
                  const SizedBox(height: 20),
                  _buildSafetyCard(
                    'assets/images/dp.jpg',
                    'Pedestrian Safety',
                    'Always use crosswalks, watch for oncoming traffic, and ensure you are visible when crossing the road.',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // About Us Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Our Mission
                  const Text(
                    'Our Mission:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'To foster safer roads and communities by empowering citizens to report traffic violations quickly and effectively. We aim to bridge the gap between citizens and authorities, ensuring accountability and promoting responsible driving practices.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Our Story
                  const Text(
                    'Our Story:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'In 2024, a vision to improve road safety became a reality with the Traffic Violation Reporting System. What started as a small idea has evolved into a platform that connects citizens and authorities, enabling transparency and fostering a culture of accountability. Together, we strive to create safer roads for everyone.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Our Values
                  const Text(
                    'Our Values:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'Integrity, Transparency, and Community Safety are at the core of our operations. We believe in fostering trust, encouraging accountability, and making roads safer through collaboration and innovative technology.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
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

  Widget _buildSafetyCard(String imagePath, String title, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
