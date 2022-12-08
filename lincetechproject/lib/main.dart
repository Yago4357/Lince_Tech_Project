import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/carprovider.dart';
import 'Controller/priceprovider.dart';
import 'Controller/vacancies.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

///Main of myApp
class MyApp extends StatelessWidget {

  ///Constructor of myApp
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CarProvider>(create: (_) => CarProvider()),
        ChangeNotifierProvider<Vacancies>(create: (_) => Vacancies()),
        ChangeNotifierProvider<PriceProvider>(create: (_) => PriceProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: namedRoutes,
        initialRoute: '/',
      ),
    );
  }
}
