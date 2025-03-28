import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar_demo/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  MyHomePage(title: '',),
    );
  }
}
