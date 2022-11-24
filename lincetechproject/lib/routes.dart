import 'package:flutter/cupertino.dart';
import 'View/homepage.dart';
import 'View/initialpage.dart';

Map<String, Widget Function(BuildContext)> namedRoutes = {
  '/InitialPage': (context) => InitialPage(),
  '/HomePage': (context) => const MyHomePage(),
};
