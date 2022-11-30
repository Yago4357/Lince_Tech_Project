import 'package:flutter/material.dart';
import 'buttondrawer.dart';

///New Widget for Drawer
class DrawerWidget extends StatelessWidget {
  ///Drawer constructor
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: const [
          DrawerButton(text: 'Home', icon: Icons.home, linkPage: '/'),
          DrawerButton(
              text: 'Price per hour',
              icon: Icons.price_change_outlined,
              linkPage: '/InitialPage'),
          DrawerButton(
              text: 'Vacanceis Number',
              icon: Icons.directions_car_filled,
              linkPage: '/InitialPage'),
          DrawerButton(
              text: 'Stays List', icon: Icons.list, linkPage: '/StayList'),
          DrawerButton(
              text: 'Income',
              icon: Icons.incomplete_circle_outlined,
              linkPage: '/InitialPage'),
        ],
      ),
    );
  }
}
