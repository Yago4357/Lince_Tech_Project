import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/Controller/vacancies.dart';
import '../Controller/carprovider.dart';
import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';
import '../Widgets/textvacancies.dart';

///Initial Page of myApp
class VacanciesPage extends StatelessWidget {
  ///Variable of vacancies
  final int nvacancies = 0;

  ///Initial Page constructor of myApp
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var car = Provider.of<CarProvider>(context);
    return  Consumer<Vacancies>(
        builder: (_, vacancies, __) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            drawer: const DrawerWidget(),
            body: Column(
              children: [
                clipPathWidget(context),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: textVacancies(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 212, 132, 60),
              onPressed: () async => {
                await vacancies.saveShared(),
                await car.getAll(),
              },
              child: const Icon(
                Icons.save,
              ),
            ),
          );
        },
      );
  }
}
