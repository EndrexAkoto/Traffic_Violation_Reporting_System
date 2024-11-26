import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              const Icon(Icons.traffic, color: Colors.white, size: 28),
              const SizedBox(width: 8),
              Text(
                'Traffic Violation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Navigation Links
          Row(
            children: [
              _buildNavLink(context, 'Home', '/'),
              _buildNavLink(context, 'About Us', '/about'),
              _buildNavLink(context, 'Contacts', '/contacts'),
              _buildNavLink(context, 'Privacy Policy', '/privacy-policy'),
              _buildNavLink(context, 'Terms of Service', '/terms-of-service'),
            ],
          ),

          // Login & Sign Up Buttons
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to create navigation links
  Widget _buildNavLink(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: TextButton.styleFrom(foregroundColor: Colors.white),
      child: Text(title),
    );
  }
}
