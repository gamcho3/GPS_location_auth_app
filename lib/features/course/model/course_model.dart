class CourseModel{
  final String name;
  final String longitude;
  final String latitude;
  final bool check;

  CourseModel( {required this.name, required this.longitude, required this.latitude,required this.check,});

  factory CourseModel.fromJson(Map<String,dynamic> json){
    return CourseModel(name: json['name'],
        longitude: json['longitude'],
        latitude: json['latitude'],
      check: json['check']
    );
  }

  @override
  String toString() {
    return 'CourseModel{name: $name, longitude: $longitude, latitude: $latitude, check: $check}';
  }
}