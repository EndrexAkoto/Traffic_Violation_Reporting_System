import 'package:flutter/material.dart';
import '../widgets/dashboard_summary.dart';  // Ensure this exists
import '../widgets/sidebar.dart';           // Ensure this exists
import '../services/api_service.dart';      // Ensure this exists

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ApiService apiService = ApiService('http://127.0.0.1:8000');
  Map<String, dynamic> dashboardData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDashboardData();
  }

  Future<void> _fetchDashboardData() async {
    try {
      final data = await apiService.fetchDashboardData();
      setState(() {
        dashboardData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Violation Reporting System'),
      ),
      drawer: const Sidebar(
        userName: 'John Doe',
        email: 'john.doe@example.com',
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome, John Doe',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DashboardSummary(
                    totalReports: dashboardData['total_reports'] ?? 0,
                    resolvedReports: dashboardData['resolved_reports'] ?? 0,
                    pendingReports: dashboardData['pending_reports'] ?? 0,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text(
                          'Map Placeholder (Coming Soon)',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
