// lib/pages/terms_of_service_page.dart

import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms of Service')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Terms of Service Content goes here.'),
      ),
    );
  }
}
