import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Admin Dashboard'),
        actions: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/admin_profile.jpg'), // Replace with the actual path
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  DropdownMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ],
                onChanged: (value) {
                  if (value == 'settings') {
                    Navigator.pushNamed(context,
                        '/admin-settings'); // Create a settings page if needed
                  } else if (value == 'logout') {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Statistics Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Total Cases', '120', Icons.receipt_long),
                _buildStatCard('Unsolved Cases', '30', Icons.warning),
                _buildStatCard('Solved Cases', '90', Icons.check_circle),
              ],
            ),
            const SizedBox(height: 20),
            // User Management Table
            Expanded(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Manage Users',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5, // Replace with dynamic user count
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.deepPurple.shade100,
                                child: Text('U${index + 1}'),
                              ),
                              title: Text('User ${index + 1}'),
                              subtitle: Text('user${index + 1}@example.com'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit,
                                    color: Colors.deepPurple),
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      '/edit-user'); // Implement this route
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '© 2024 Traffic Violation Reporting System',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon) {
    return Card(
      elevation: 5,
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.deepPurple),
            const SizedBox(height: 10),
            Text(
              count,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
