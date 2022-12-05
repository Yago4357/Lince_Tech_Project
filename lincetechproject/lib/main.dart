import 'package:flutter/material.dart';
import 'Controller/database.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
  DatabaseStay().init();
}

///Main of myApp
class MyApp extends StatelessWidget {

  ///Constructor of myApp
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: namedRoutes,
      initialRoute: '/',
    );
  }
}
