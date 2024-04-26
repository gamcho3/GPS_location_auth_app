import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          zoom: 20.0,
          target: LatLng(35.875629211048896, 128.6813081956605),
        ),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
