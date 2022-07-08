import 'homepage.dart';
import 'package:flutter/material.dart';

void main() {
  // flutter run -d chrome --no-sound-null-safety --web-renderer=html
  // flutter run --no-sound-null-safety
  // flutter build web --no-sound-null-safety --web-renderer=html

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Book API Sim",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
