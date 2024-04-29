import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/model/account_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  AccountModel? _model = null;
  AccountModel? get model => _model;

  void googleLogin() async {
    // web으로 구현할때
    // // Create a new provider
    // GoogleAuthProvider googleProvider = GoogleAuthProvider();

    // googleProvider
    //     .addScope('https://www.googleapis.com/auth/contacts.readonly');
    // googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // // Once signed in, return the UserCredential
    // await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // // Or use signInWithRedirect
    // // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);

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
        final data = AccountModel.fromJson(
            account?.displayName, account.email, account?.photoUrl);
        _model = data;
        print(_model);
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
