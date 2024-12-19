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
          // Title Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Accidents Reported by County',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(),

          // List of Reported Cases
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
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/accident_placeholder.jpg', // Replace with dynamic image/video thumbnail
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Case ${index + 1} - Nairobi',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Type: Road Accident',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Cause: Overloading (Lorry, KBC 123A)',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/case-details',
                        arguments: {
                          'caseId': index + 1,
                          'county': 'Nairobi',
                          'type': 'Road Accident',
                          'cause': 'Overloading',
                          'vehicle': 'Lorry',
                          'plate': 'KBC 123A',
                          'media': 'assets/images/accident_placeholder.jpg',
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Footer Section
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text(
                  'Powered by Traffic Safety Initiative',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '© ${DateTime.now().year} Traffic Management System',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
