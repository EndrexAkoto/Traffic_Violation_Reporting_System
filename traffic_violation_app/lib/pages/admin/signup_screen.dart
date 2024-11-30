import 'package:flutter/material.dart';

class AdminSignUpScreen extends StatelessWidget {
  const AdminSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Signup'),
      ),
      body: const Center(
        child: Text('Admin Signup Screen'),
      ),
    );
  }
}
