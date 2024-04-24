import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/login_screen.dart';
import 'package:flutter_application_1/features/home/home_screen.dart';
import 'package:flutter_application_1/layouts/default_layout.dart';
import 'package:flutter_application_1/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      print('user uid ::: ${auth.currentUser?.uid}');
    }
    return DefaultLayout(
      children: [
        HomeScreen(),
        Container(
          child: Center(
            child: Text("인사말"),
          ),
        ),
        Container(
          child: Center(
            child: Text("코스안내"),
          ),
        ),
        Container(
          child: Center(
            child: Text("QR"),
          ),
        )
      ],
    );
  }
}
