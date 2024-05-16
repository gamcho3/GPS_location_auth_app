import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/login_screen.dart';
import 'package:flutter_application_1/features/auth/providers/login_provider.dart';
import 'package:flutter_application_1/features/auth/repository/auth_repository.dart';
import 'package:flutter_application_1/features/course/course_screen.dart';
import 'package:flutter_application_1/features/course/providers/location_provider.dart';
import 'package:flutter_application_1/features/home/home_screen.dart';
import 'package:flutter_application_1/layouts/default_layout.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(authRepository: AuthRepositoryImpl())),
        ChangeNotifierProvider(create: (_) => LocationProvider())
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "NanumSquare",
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(73, 162, 247, 0))
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        HomeScreen(),
        Container(
          child: Center(
            child: Text("인사말"),
          ),
        ),
        CourseScreen(),
        Container(
          child: Center(
            child: Text("QR"),
          ),
        )
      ],
    );
  }
}
