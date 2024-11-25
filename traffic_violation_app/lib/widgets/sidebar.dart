import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final String userName;
  final String email;

  const Sidebar({super.key, required this.userName, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                userName[0],
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Violation History'),
            onTap: () {
              // Navigate to Violation History
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to Settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
