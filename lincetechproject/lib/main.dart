import 'package:flutter/material.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

///Main of myApp
class MyApp extends StatelessWidget {

  ///Constrctor of myApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}