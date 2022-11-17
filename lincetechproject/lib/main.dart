import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Classes/vagas.dart';
import 'Screens/initialpage.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Vagas()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: InitialPage(),
    );
  }
}