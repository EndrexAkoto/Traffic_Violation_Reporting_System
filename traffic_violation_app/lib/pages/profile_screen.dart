import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For displaying statistics in chart form

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Mock data for user info and stats
  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";
  final String userPhone = "+254 712 345678"; // Mock phone number
  final String county = "Nairobi"; // Mock county data
  final int casesReported = 20;
  final int casesSolved = 15;
  final int casesUnsolved = 5;
  final int casesPending = 10; // New case type for pending

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        backgroundColor: const Color(0xFF6200EA), // Theme color
        actions: [
          // Settings and Logout dropdown
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'settings') {
                // Navigate to settings page
                Navigator.pushNamed(context, '/settings');
              } else if (result == 'logout') {
                // Log out functionality
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Settings', 'Log Out'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice.toLowerCase(),
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile section
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png', // Placeholder image
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  userEmail,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Phone: $userPhone",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "County: $county",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 32),

              // Displaying solved, unsolved, and pending case count
              Text(
                'Case Statistics:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6200EA), // Theme color
                ),
              ),
              const SizedBox(height: 16),
              _buildCaseStatRow("Solved Cases", casesSolved),
              _buildCaseStatRow("Unsolved Cases", casesUnsolved),
              _buildCaseStatRow("Pending Cases", casesPending),
              const SizedBox(height: 16),

              // Statistics section with chart
              Text(
                'Statistics in Chart:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6200EA), // Theme color
                ),
              ),
              const SizedBox(height: 16),
              _buildStatChart(),
              const SizedBox(height: 32),

              // Action buttons with adjusted size
              _buildActionButton(
                context,
                'View Cases',
                () {
                  // Navigate to View Cases page
                  Navigator.pushNamed(context, '/view_cases');
                },
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                context,
                'Report New Violation',
                () {
                  // Navigate to Report Violation page
                  Navigator.pushNamed(context, '/report_violation');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create case statistics rows
  Widget _buildCaseStatRow(String label, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Helper function to create stat chart
  Widget _buildStatChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: casesReported.toDouble(),
                  color: const Color(0xFF6200EA), // Purple for reported cases
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: casesSolved.toDouble(),
                  color: const Color(0xFF4CAF50), // Green for solved cases
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: casesUnsolved.toDouble(),
                  color: const Color(0xFFFF5722), // Orange for unsolved cases
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: casesPending.toDouble(),
                  color: const Color(0xFFFFC107), // Yellow for pending cases
                  width: 20,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for action buttons
  Widget _buildActionButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6200EA), // Theme color
        minimumSize: const Size(150, 50), // Adjust width here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label),
    );
  }
}
