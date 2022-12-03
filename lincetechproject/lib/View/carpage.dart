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
      child: Consumer<CarProvider>(builder: (_, Car, __) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const DrawerWidget(),
          body: Column(
            children: [
              const Center(
                child: TextPrice(),
              ),
              TextButton(
                onPressed: (){
                  Car.add();
                  Car.getAll();
                  Navigator.popAndPushNamed(context,'/StayList');
                },
                child: const Icon(Icons.add_box),
              ),
            ],
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
          TextFormField(
            controller: state.controllerPlate,
          ),
          TextFormField(
            controller: state.controllerDriver,
          ),
        ],
      ),
    );
  }
}
