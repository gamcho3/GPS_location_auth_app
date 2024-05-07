import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/features/course/model/course_model.dart';
import 'package:logger/logger.dart';

class CourseRepository {
  Future<List<CourseModel>> getSpots() async {
    final db = FirebaseFirestore.instance;
    final collection = await db.collection("spots").get();
    final spots = collection.docs;
    return spots
        .map((spot) => CourseModel(
            name: spot.data()['name'],
            longitude: spot.data()['longitude'],
            latitude: spot.data()['latitude'],
            check: spot.data()['check']))
        .toList();
  }
}
