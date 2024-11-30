import 'package:flutter/material.dart';

class CaseDetailsPage extends StatelessWidget {
  const CaseDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetching caseId from arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int caseId = args['caseId'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Case Details: $caseId'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Case ID: $caseId',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'This section contains details about the case.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Status:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pending/Resolved',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
