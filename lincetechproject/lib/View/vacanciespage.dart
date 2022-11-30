import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/Controller/vacancies.dart';
import '../Widgets/drawer.dart';

///Initial Page of myApp
class VacanciesPage extends StatelessWidget {
  ///Variable of vacancies
  final int nvacancies = 0;

  ///Initial Page constructor of myApp
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Vacancies(),
      child: Consumer<Vacancies>(
        builder: (_, vacancies, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            drawer: const DrawerWidget(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: TextVacancies(),
                    ),
                    Text(
                      vacancies.vacancies.toString(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: vacancies.saveShared,
              child: const Icon(
                Icons.save,
              ),
            ),
          );
        },
      ),
    );
  }
}

///Widget to set Controller of TextFormField
class TextVacancies extends StatelessWidget {
  ///Widget constructor of TextVacancies
  const TextVacancies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Vacancies>(context);

    return Center(
      child: TextFormField(
        controller: state.controller,
      ),
    );
  }
}
