import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  String username = '';
  String email = '';
  String profilePicUrl = '';

  final picker = ImagePicker();

  // Function to get user profile
  Future<void> getUserProfile() async {
    final response =
        await http.get(Uri.parse('http://your-api-url/api/profile'), headers: {
      'Authorization': 'Bearer YOUR_JWT_TOKEN', // Use stored JWT token here
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        username = data['username'];
        email = data['email'];
        profilePicUrl = data['profile_pic'] ?? '';
      });
    } else {
      // Handle error
    }
  }

  // Function to pick a new image
  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to update the user profile
  Future<void> updateProfile() async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse('http://your-api-url/api/profile'),
    );
    request.headers['Authorization'] =
        'Bearer YOUR_JWT_TOKEN'; // Use stored JWT token

    // Add the fields for username, email, and profile picture
    request.fields['username'] = username;
    request.fields['email'] = email;

    if (_profileImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('profile_pic', _profileImage!.path),
      );
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      // Profile updated successfully
    } else {
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    getUserProfile(); // Fetch the user's profile details on load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : NetworkImage(profilePicUrl) as ImageProvider,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Change Profile Picture'),
            ),
            TextField(
              controller: TextEditingController(text: username),
              decoration: InputDecoration(labelText: 'Username'),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            TextField(
              controller: TextEditingController(text: email),
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateProfile,
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
