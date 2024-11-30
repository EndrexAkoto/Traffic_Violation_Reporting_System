import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: const Text(
          'Statistics Page Under Construction',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
