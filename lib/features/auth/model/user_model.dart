import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel{
  final String? name;
  final String email;
  final String? imageUrl;
  final List<String> spots;

  AccountModel({required this.name, required this.email, required this.imageUrl,required this.spots});

  factory AccountModel.fromJson(String? name,String email,String? imageUrl,List<String> spots){
    return AccountModel(name: name,email: email,imageUrl: imageUrl,spots: spots);
  }

  factory AccountModel.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return AccountModel(
      name: data?['name'],
      email: data?['email'],
      imageUrl: data?['imageUrl'],
      spots: data?['spots']
    );
  }

  @override
  String toString() {
    return 'AccountModel{name: $name, email: $email, imageUrl: $imageUrl}';
  }
}