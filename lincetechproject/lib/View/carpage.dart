import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Widgets/drawer.dart';

///Price per hour page
class CarPage extends StatelessWidget {
  ///Constructor of Price per hour page
  const CarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: Consumer<CarProvider>(builder: (_, car, __) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const DrawerWidget(),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Center(
                      child: TextPrice(),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.00),
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Tirar Foto'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.00),
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Escolher da galeria'),
                              ),
                            ),
                          )
                        ]),
                  ],
                ),
              ],
            ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              car.add();
              await Navigator.popAndPushNamed(context, '/StayList');
            },
            child: const Icon(Icons.add_box),
          ),
        );
      }),
    );
  }
}

///Widget to set Controller of TextFormField
class TextPrice extends StatelessWidget {
  ///Widget constructor of TextVacancies
  const TextPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CarProvider>(context);

    return SizedBox(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(
                top: 30.00, right: 20.00, left: 20.00, bottom: 10.00),
            child: TextFormField(
              controller: state.controllerPlate,
            ),
          ),
          Card(
            margin: const EdgeInsets.only(
                top: 10.00, left: 20.00, right: 20.00, bottom: 20.00),
            child: TextFormField(
              controller: state.controllerDriver,
            ),
          ),
        ],
      ),
    );
  }
}
