import 'package:flutter/material.dart';

class AdminSettingsPage extends StatelessWidget {
  const AdminSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: const Text(
          'Settings Page Under Construction',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
