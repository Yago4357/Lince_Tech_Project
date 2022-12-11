import 'package:flutter/cupertino.dart';
import 'View/carpage.dart';
import 'View/homepage.dart';
import 'View/incomepage.dart';
import 'View/pricepage.dart';
import 'View/staylist.dart';
import 'View/vacanciespage.dart';

///Map to define the named Routes
Map<String, Widget Function(BuildContext)> namedRoutes = {
  '/': (context) => const HomePage(),
  '/VacanciesPage': (context) => const VacanciesPage(),
  '/CarPage': (context) => const CarPage(),
  '/StayList': (context) => StayList(),
  '/PricePage': (context) => const PricePage(),
  '/IncomePage': (context) => const IncomePage(),
};
