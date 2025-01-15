import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        backgroundColor: Colors.deepPurple,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  _showNotifications(context);
                },
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: const Text(
                    '3', // Replace with dynamic count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.deepPurple,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: const AssetImage('assets/dp.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                ),
              ],
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

          const Divider(),

          // Display Recent Activity or Cases
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('File a New Report'),
                    leading: const Icon(Icons.report, color: Colors.deepPurple),
                    onTap: () {
                      Navigator.pushNamed(context, '/file-report');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('View All Cases'),
                    leading: const Icon(Icons.folder, color: Colors.deepPurple),
                    onTap: () {
                      Navigator.pushNamed(context, '/all-cases');
                    },
                  ),
                ],
              ),
            ),
          ),

          // Footer Section
          Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                '© 2024 Agriland. All rights reserved.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaseStatusButton(
      BuildContext context, String label, String route) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _showNotifications(BuildContext context) async {
    // Fetch notifications dynamically
    final notifications = await fetchNotifications();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications'),
          content: notifications.isEmpty
              ? const Text('You have no new notifications.')
              : SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          notifications[index]['title'] ??
                              'No Title', // Default value
                        ),
                        subtitle: Text(
                          notifications[index]['description'] ??
                              'No Description', // Default value
                        ),
                        leading: const Icon(
                          Icons.notification_important,
                          color: Colors.deepPurple,
                        ),
                        onTap: () {
                          // Handle notification click
                        },
                      );
                    },
                  ),
                ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<List<Map<String, String>>> fetchNotifications() async {
    // Replace this mock function with actual backend API call
    await Future.delayed(const Duration(seconds: 1)); // Simulating delay
    return [
      {
        'title': 'New Report Submitted',
        'description': 'A new case has been reported.'
      },
      {
        'title': 'Case Resolved',
        'description': 'Case #12345 has been marked as resolved.'
      },
    ];
  }
}
