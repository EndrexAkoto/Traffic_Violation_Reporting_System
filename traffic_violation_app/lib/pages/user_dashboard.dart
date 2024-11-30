import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Overview
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/dp.jpg'),
            ),
            title: const Text('John Doe'),
            subtitle: const Text('Email: john.doe@example.com'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
            ),
          ),

          // Quick Navigation to Case Statuses
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCaseStatusButton(context, 'Reported', '/reported-cases'),
                _buildCaseStatusButton(context, 'Unsolved', '/unsolved-cases'),
                _buildCaseStatusButton(context, 'Solved', '/solved-cases'),
              ],
            ),
          ),

          // Display Recent Activity or Cases
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('File a New Report'),
                  onTap: () {
                    Navigator.pushNamed(context, '/file-report');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaseStatusButton(
      BuildContext context, String label, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(label),
    );
  }
}
