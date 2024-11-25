import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';  // For File handling
import 'package:http/http.dart' as http;

class ReportViolationScreen extends StatefulWidget {
  const ReportViolationScreen({super.key});

  @override
  _ReportViolationScreenState createState() => _ReportViolationScreenState();
}

class _ReportViolationScreenState extends State<ReportViolationScreen> {
  late GoogleMapController mapController;
  late LatLng _center;
  File? _image;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _center = LatLng(0.0, 0.0);  // Default location
  }

  // Pick an image using the image picker
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  // Function to handle form submission (sending data to backend)
  Future<void> _submitViolation() async {
    var response = await http.post(
      Uri.parse('http://your-backend-url/report_violation/'),
      body: {
        'description': _descriptionController.text,
        'location': '$_center', // Send the location as string
        'media_url': _image?.path ?? ''
      },
    );
    if (response.statusCode == 200) {
      // Handle success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Violation reported successfully!')),
      );
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to report violation.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Traffic Violation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image picker button
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),

            // Description text field
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Violation Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            // Google Maps for location
            SizedBox(
              height: 300,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                onTap: (LatLng location) {
                  setState(() {
                    _center = location;
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: _submitViolation,
              child: Text('Submit Violation'),
            ),
          ],
        ),
      ),
    );
  }
}
