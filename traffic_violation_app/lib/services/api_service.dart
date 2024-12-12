import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<bool> signUp(String email, String password) async {
    final url = Uri.parse(
        '$baseUrl/register'); // Ensure the endpoint matches your backend
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        return true; // Successfully signed up
      } else {
        throw Exception('Sign up failed: ${response.body}');
      }
    } catch (error) {
      throw Exception('Sign up failed: $error');
    }
  }
}
