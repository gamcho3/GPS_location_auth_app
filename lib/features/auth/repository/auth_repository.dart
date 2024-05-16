import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

abstract class AuthRepository {
  void getUser(String uid);

  void signUp(
      {required String email,
      String? password,
      required String uid,
      String? imageUrl});

  void normalLogin(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  void getUser(String uid) {
    final db = FirebaseFirestore.instance;
    final collection = db.collection("users").doc(uid).withConverter(
        fromFirestore: UserModel.fromFirestore,
        toFirestore: (user, _) => user.toFirestore());
  }

  @override
  void normalLogin(String email, String password) {
    // TODO: implement normalLogin
  }

  @override
  void signUp(
      {required String email,
      String? password,
      required String uid,
      String? imageUrl}) async {
    final db = FirebaseFirestore.instance;

    db.collection('users').doc(uid).set({
      'email': email,
      'password': password,
      'spots': [],
      'imageUrl': imageUrl
    }).onError((e, _) => print("Error writing document: $e"));

    // TODO: implement signUp
  }
}
