import 'package:flutter/material.dart';

class UnsolvedCasesPage extends StatelessWidget {
  const UnsolvedCasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unsolved Cases'),
      ),
      body: ListView.builder(
        itemCount: 8, // Replace with actual unsolved case count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Unsolved Case ${index + 1}'),
            subtitle: const Text('Details about the unsolved case'),
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
