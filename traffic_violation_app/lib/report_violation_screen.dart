import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // For LatLng
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For File handling
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding

class ReportViolationScreen extends StatefulWidget {
  @override
  _ReportViolationScreenState createState() => _ReportViolationScreenState();
}

class _ReportViolationScreenState extends State<ReportViolationScreen> {
  LatLng _selectedLocation =
      LatLng(1.2921, 36.8219); // Default to Nairobi, Kenya
  TextEditingController _crimeTypeController = TextEditingController();
  TextEditingController _crimeDescriptionController = TextEditingController();

  // Function to handle location selection
  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedLocation = position;
    });
  }

  // Function to submit the crime report
  Future<void> _submitReport() async {
    if (_crimeTypeController.text.isEmpty ||
        _crimeDescriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }

    final response = await http.post(
      Uri.parse(
          'http://localhost:3000/api/report-crime'), // Your Flask backend endpoint
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'crimeType': _crimeTypeController.text,
        'crimeDescription': _crimeDescriptionController.text,
        'latitude': _selectedLocation.latitude,
        'longitude': _selectedLocation.longitude,
      }),
    );

    if (response.statusCode == 201) {
      // Success
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Crime reported successfully!')));
    } else {
      // Error
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error reporting crime!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report a Crime"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // OpenStreetMap to select location
            Container(
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  center: _selectedLocation,
                  zoom: 12,
                  onTap: (tapPosition, point) {
                    _onMapTapped(point);
                  },
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        point: _selectedLocation,
                        builder: (context) =>
                            Icon(Icons.location_on, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Crime Type Input
            TextField(
              controller: _crimeTypeController,
              decoration: InputDecoration(labelText: 'Crime Type'),
            ),
            SizedBox(height: 10),
            // Crime Description Input
            TextField(
              controller: _crimeDescriptionController,
              decoration: InputDecoration(labelText: 'Crime Description'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            // Submit Button
            ElevatedButton(
              onPressed: _submitReport,
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
