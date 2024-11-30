import 'package:flutter/material.dart';

class ManageCasesPage extends StatelessWidget {
  const ManageCasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Cases'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual count
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.report, color: Colors.deepPurple),
            title: Text('Case ${index + 1}'),
            subtitle: Text('Status: Pending'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.deepPurple),
              onPressed: () {
                // Navigate to case details page
                Navigator.pushNamed(context, '/case-details');
              },
            ),
          );
        },
      ),
    );
  }
}
