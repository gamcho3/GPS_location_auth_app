import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? name;
  final String email;
  final String? imageUrl;
  final List<String> spots;

  UserModel({required this.name, required this.email, required this.imageUrl,required this.spots});

  factory UserModel.fromJson(String? name,String email,String? imageUrl,List<String> spots){
    return UserModel(name: name,email: email,imageUrl: imageUrl,spots: spots);
  }

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      email: data?['email'],
      imageUrl: data?['imageUrl'],
      spots: data?['spots']
    );
  }

Map<String,dynamic> toFirestore(){
    return {
     if(name !=null) 'name': name,
    'email': email,
    if(imageUrl !=null)  'imageUrl': imageUrl,
      'spots': spots
    };
  }

  @override
  String toString() {
    return 'AccountModel{name: $name, email: $email, imageUrl: $imageUrl}';
  }
}