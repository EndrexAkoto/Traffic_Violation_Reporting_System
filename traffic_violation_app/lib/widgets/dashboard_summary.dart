import 'package:flutter/material.dart';

class DashboardSummary extends StatelessWidget {
  final int totalReports;
  final int resolvedReports;
  final int pendingReports;

  const DashboardSummary({
    super.key,
    required this.totalReports,
    required this.resolvedReports,
    required this.pendingReports,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSummaryCard('Total Reports', totalReports, Colors.blue),
        _buildSummaryCard('Resolved', resolvedReports, Colors.green),
        _buildSummaryCard('Pending', pendingReports, Colors.red),
      ],
    );
  }

  Widget _buildSummaryCard(String title, int count, Color color) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
