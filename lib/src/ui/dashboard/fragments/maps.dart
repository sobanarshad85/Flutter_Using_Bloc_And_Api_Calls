import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class KodetrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     title: 'Flutter Google Maps',
      home: Scaffold(
        body: GoogleMap(
            // type dari map dengan beberapa type yakni hybrid, normal, satellite, terrain dan none
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true,
            // posisi camera dengan menentukan lokasi berdasar latitude dan longitude
            initialCameraPosition: CameraPosition(
              target: LatLng(31.4670, 74.3048),
              zoom: 20.4746, 
            ),
          ),
      ),
    );
  }
}