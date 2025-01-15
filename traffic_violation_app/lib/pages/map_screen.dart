import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  final LatLng _initialPosition =
      LatLng(37.7749, -122.4194); // San Francisco coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: _initialPosition,
          zoom: 10,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                point: _initialPosition,
                builder: (ctx) =>
                    const Icon(Icons.location_pin, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
