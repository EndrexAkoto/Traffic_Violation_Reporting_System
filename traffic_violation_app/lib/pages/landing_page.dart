import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.traffic,
                color: Color.fromARGB(255, 82, 209, 9)), // Logo placeholder
            const SizedBox(width: 50),
            const Text('Traffic Violation Reporting System'),
          ],
        ),
        actions: [
          Tooltip(
            message: 'Home',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: const Text('Home',
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'About Us',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('About Us',
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'Contact Us',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/contacts'),
              child: const Text('Contact',
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'Login',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Login',
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
          Tooltip(
            message: 'Sign Up',
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign Up',
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            // Search Bar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Traffic Violations',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.deepPurple),
                ),
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
            // Quick Action Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionItem(Icons.report_problem, 'Report a Violation'),
                  _buildActionItem(Icons.visibility, 'View Active Cases'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Carousel Section (Featured Reports or News)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Reports',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCarouselItem(
                            'Safety Alert: Speeding in Residential Areas'),
                        _buildCarouselItem(
                            'New Campaign: Safe Pedestrian Crossings'),
                        _buildCarouselItem('Tips for Winter Driving Safety'),
                        _buildCarouselItem(
                            'New Traffic Law: Hands-Free Devices'),
                        _buildCarouselItem(
                            'Improved Road Signage for Night Driving'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Statistics Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistics',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatisticCard('Total Violations', '1200'),
                      _buildStatisticCard('Solved Cases', '800'),
                      _buildStatisticCard('Unsolved Cases', '400'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSafetyCard(
                          'assets/images/dp.jpg',
                          'Safety Tips for Drivers',
                          'Stay alert, follow traffic rules, and drive defensively to ensure everyone’s safety on the road.'),
                      _buildSafetyCard(
                          'assets/images/dp.jpg',
                          'Pedestrian Safety',
                          'Always use crosswalks, watch for oncoming traffic, and ensure you are visible when crossing the road.'),
                      _buildSafetyCard('assets/images/dp.jpg', 'Cyclist Safety',
                          'Wear helmets, use proper signaling, and stay in the bike lanes to protect yourself and others.'),
                    ],
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
                        onPressed: () =>
                            Navigator.pushNamed(context, '/privacy-policy'),
                        child: const Text('Privacy Policy',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/terms-of-service'),
                        child: const Text('Terms of Service',
                            style: TextStyle(color: Colors.white)),
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

  Widget _buildActionItem(IconData icon, String title) {
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

  Widget _buildCarouselItem(String title) {
    return Card(
      margin: const EdgeInsets.only(right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildStatisticCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyCard(String imagePath, String title, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
