import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/features/auth/login_screen.dart';
import 'package:flutter_application_1/splash_screen.dart';

final routes = {'/': (_) => MainScreen(),
  '/login': (context) => LoginScreen(),
  '/splash': (context)=> SplashScreen()};
