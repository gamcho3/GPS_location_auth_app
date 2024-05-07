import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/auth/providers/login_provider.dart';
import 'package:flutter_application_1/features/course/providers/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'model/course_model.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    context.read<LocationProvider>().getCurLocation();
    context.read<LocationProvider>().getSpots();

    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<LocationProvider>(builder: (context, provider, _) {
            List<CourseModel>? list = provider.courses;
            LatLng? location = provider.curPosition;
            return switch (list) {
              List<CourseModel>() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...list.map((e) => ElevatedButton(
                        onPressed: () =>
                            provider.moveSpots(lat:  e.latitude,long:  e.longitude,controller: _controller),
                        child: Text(e.name))),
                    ElevatedButton(
                        onPressed: () => provider.moveSpots(lat: location!.latitude.toString(), long: location.longitude.toString(), controller: _controller),
                        child: Text("현재위치"))
                  ],
                ),
              _ => Container()
            };
          }),
        ),
        Expanded(
          child: Consumer<LocationProvider>(builder: (context, provider, _) {
            LatLng? location = provider.curPosition;
            var logger = Logger();
            logger.i(location);
            final spots = provider.courses
                ?.map((e) => Marker(
                    markerId: MarkerId(e.name),
                    position: LatLng(
                        double.parse(e.latitude), double.parse(e.longitude))))
                .toSet();
            return switch (location) {
              LatLng() => GoogleMap(
                  // myLocationEnabled: true,
                  markers: spots ?? {},
                  initialCameraPosition: CameraPosition(
                    zoom: 20.0,
                    target: location,
                  ),

                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    _controller.complete(controller);

                  },
                ),
              _ => const Center(child: CircularProgressIndicator())
            };
          }),
        ),
      ],
    );
  }
}
