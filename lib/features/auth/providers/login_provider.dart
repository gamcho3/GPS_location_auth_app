import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/model/user_model.dart';
import 'package:flutter_application_1/features/common/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../repository/auth_repository.dart';


class LoginProvider with ChangeNotifier ,CustomLogger{

  late AuthRepository _authRepository;

  LoginProvider({AuthRepository? authRepository}) {
    _authRepository = authRepository ?? AuthRepositoryImpl();
  }

  UserModel? _model = null;
  UserModel? get model => _model;

  void signUp(email,password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      logInfo(user?.uid);


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void normalLogin(email,password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void googleLogin() async {


    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];



    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final googleAuth = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final user = userCredential.user;
        _authRepository.signUp(email: account.email, uid: user!.uid, imageUrl: account.photoUrl);

        // final data = UserModel.fromJson(
        //     account.displayName, account.email, account.photoUrl,);
        // _model = data;
        print(_model);
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }

  void autoLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
