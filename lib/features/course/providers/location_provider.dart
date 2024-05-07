
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/course/model/course_model.dart';
import 'package:flutter_application_1/features/course/repository/course_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class LocationProvider with ChangeNotifier {
  LatLng? _curPosition;
  List<CourseModel>? _courses;

  LatLng? get curPosition => _curPosition;
  List<CourseModel>? get courses => _courses;

  void getCurLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //TODO: 에러 처리
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final Position location = await Geolocator.getCurrentPosition();
    _curPosition = LatLng(location.latitude, location.longitude);
    notifyListeners();
  }

  void getSpots() async {
    final repository = CourseRepository();
    final list = await repository.getSpots();
    _courses = list;
    notifyListeners();
    // var logger = Logger();
    // logger.i(list[0].toString());
  }

  void moveSpots({required String lat, required String long,required Completer<GoogleMapController> controller}) async{
    GoogleMapController mapController = await controller.future;
    final CameraPosition position = CameraPosition(
      target: LatLng(double.parse(lat), double.parse(long)),
      zoom: 20,
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(position));
    // _curPosition = LatLng(double.parse(lat), double.parse(long));
    // notifyListeners();
  }
}
