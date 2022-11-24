import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/drawer.dart';
import '/Controller/vagas.dart';

///Initial Page of myApp
class InitialPage extends StatelessWidget {
  int Nvacancies = 0;

  ///Initial Page constructor of myApp
  InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Vagas(),
      child: Consumer<Vagas>(
        builder: ((_, vaga, __) {
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
                        padding: EdgeInsets.all(32.0), child: TextVagas()),
                    Text(
                      vaga.vacancies.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline2,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: vaga.getShared,
              child: const Icon(
              Icons.save,
            ),
          ),);
        }),
      ),
    );
  }
}

class TextVagas extends StatelessWidget {
  const TextVagas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Vagas>(context);

    return Center(
      child: TextFormField(
        controller: state.controller,
      ),
    );
  }
}
