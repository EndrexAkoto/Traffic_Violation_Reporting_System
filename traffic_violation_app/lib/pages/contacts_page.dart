import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Add this import
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Helper function to launch social media URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'You can reach us via any of the following channels:',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Social Media Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                  onPressed: () => _launchURL('https://www.facebook.com/yourpage'),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.twitter, color: Colors.blue),
                  onPressed: () => _launchURL('https://twitter.com/yourprofile'),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.instagram, color: Colors.pink),
                  onPressed: () => _launchURL('https://www.instagram.com/yourprofile'),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.envelope, color: Colors.red),
                  onPressed: () => _launchURL('mailto:your.email@example.com'),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.tiktok, color: Colors.black),
                  onPressed: () => _launchURL('https://www.tiktok.com/@yourprofile'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Footer
            const Divider(),
            const Text(
              '© 2024 Traffic Violation Reporting System. All rights reserved.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
