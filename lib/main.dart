import 'package:calculatorapp/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
