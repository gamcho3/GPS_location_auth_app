import 'package:flutter/material.dart';
import 'package:flutter_application_1/layouts/default_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DefaultLayout(
        children: [
          Container(
            child: Center(
              child: Text("홈"),
            ),
          ),
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
      ),
    );
  }
}
