import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Widgets/drawer.dart';

///Page for the Stay list
class StayList extends StatelessWidget {

  ///Stay List constructor
  const StayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: Consumer<CarProvider>(builder: (_, car, __) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const DrawerWidget(),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: car.stayList.length,
                  itemBuilder: cardCar,
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.00),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.pushNamed(context, '/CarPage');
                              car.getAll();
                            },
                            child: const Text('Add um'),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.00),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: car.getAll,
                            child: const Text('Vamos Dales'),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  ///Card for the ListView builder
  Widget cardCar(BuildContext context,int index) {

    final stay = CarProvider().stayList[index];

    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: Consumer<CarProvider>(builder: (_, car, __) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                  child: Row(children: [
                    Text(
                      stay.licenseplate,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Text(stay.drivername),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                  child: Row(children: [
                    Text(DateFormat('dd/MM/yyyy').format(stay.entrydate)),
                  ]),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
