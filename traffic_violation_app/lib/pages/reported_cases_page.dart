import 'package:flutter/material.dart';

class ReportedCasesPage extends StatelessWidget {
  const ReportedCasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reported Cases',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          // Profile image with dropdown
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PopupMenuButton<String>(
              icon: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile.jpg'), // Replace with your image path
                radius: 16,
              ),
              onSelected: (value) {
                if (value == 'settings') {
                  Navigator.pushNamed(context, '/settings');
                } else if (value == 'logout') {
                  Navigator.pushNamed(context, '/login');
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual data count
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      'Case ${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: const Text(
                      'Details about the reported case',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/case-details',
                        arguments: {'caseId': index + 1},
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // Footer
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: const Text(
              '© 2024',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
