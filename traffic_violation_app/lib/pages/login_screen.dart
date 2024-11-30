import 'package:flutter/material.dart';
import 'dart:convert'; // Ensure this is imported for JSON decoding
import 'package:http/http.dart' as http; // Import the HTTP package

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

      final response = await http.post(
        Uri.parse(
            'http://your_backend_url/api/login'), // Replace with your actual backend URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print('Response status: ${response.statusCode}'); // Debugging line

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        print('Token received: $token'); // Debugging line

        // You can store the token and navigate as needed, for example:
        // Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        print('Login failed with response: ${response.body}'); // Debugging line
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Check credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Calling _login on button press
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
