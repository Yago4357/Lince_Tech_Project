import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Widgets/drawer.dart';

class StayList extends StatelessWidget {
  const StayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: Consumer<CarProvider>(builder: (_, Car, __) {
        return Scaffold(
          drawer: const DrawerWidget(),
          body:
          ListView(
            scrollDirection: Axis.vertical,
            children: [
            TextButton(onPressed: Car.teste,
            child: Text(Car.stayList.toString()),),
          ],
        ),);
      }),
    );
  }
}
