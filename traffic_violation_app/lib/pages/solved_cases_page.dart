import 'package:flutter/material.dart';

class SolvedCasesPage extends StatelessWidget {
  const SolvedCasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solved Cases'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with actual solved case count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Solved Case ${index + 1}'),
            subtitle: const Text('Details about the solved case'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/case-details',
                  arguments: {'caseId': index + 1});
            },
          );
        },
      ),
    );
  }
}
