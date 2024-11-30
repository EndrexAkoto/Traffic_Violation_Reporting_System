import 'package:flutter/material.dart';

class ReportedCasesPage extends StatelessWidget {
  const ReportedCasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reported Cases'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual data count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Case ${index + 1}'),
            subtitle: const Text('Details about the reported case'),
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
