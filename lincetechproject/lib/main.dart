import 'package:flutter/material.dart';
import 'View/homepage.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

///Main of myApp
class MyApp extends StatelessWidget {

  ///Constrctor of myApp
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: namedRoutes,
      home: const MyHomePage(),
    );
  }
}
