import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For HTTP requests

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login
  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      print('Attempting login with email: $email'); // Debugging line

      try {
        final response = await http.post(
          Uri.parse('http://192.168.137.149:3000/api/login'), // Updated URL
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'password': password}),
        );

        print('Response status: ${response.statusCode}'); // Debugging line

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final token = data['token'];
          print('Token received: $token'); // Debugging line

          // Store the token and navigate as needed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful')),
          );
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          print(
              'Login failed with response: ${response.body}'); // Debugging line
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed. Check credentials')),
          );
        }
      } catch (e) {
        print('An error occurred: $e'); // Debugging line
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF6200EA), // Deep purple color
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Email and password form fields
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Calling _login on button press
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF6200EA), // Deep purple button
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 20),
              // Footer with copyright and theme color
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '© 2024 Traffic Violation Reporting System',
                  style: TextStyle(
                    color: const Color(0xFF6200EA), // Deep purple footer text
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
