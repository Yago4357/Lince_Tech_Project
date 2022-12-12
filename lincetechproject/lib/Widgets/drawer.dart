import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'buttondrawer.dart';

///New Widget for Drawer
class DrawerWidget extends StatelessWidget {
  ///Drawer constructor
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 212, 132, 60),
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            DrawerButton(text:  AppLocalizations.of(context)!.home, icon: Icons.home, linkPage: '/'),
            DrawerButton(
                text: AppLocalizations.of(context)!.pricePerHour,
                icon: Icons.price_change_outlined,
                linkPage: '/PricePage'),
            DrawerButton(
                text: AppLocalizations.of(context)!.numberOfVacancies,
                icon: Icons.directions_car_filled,
                linkPage: '/VacanciesPage'),
            DrawerButton(
                text: AppLocalizations.of(context)!.stayList, icon: Icons.list, linkPage: '/StayList'),
            DrawerButton(
                text:  AppLocalizations.of(context)!.income,
                icon: Icons.incomplete_circle_outlined,
                linkPage: '/IncomePage'),
          ],
        ),
      ),
    );
  }
}
