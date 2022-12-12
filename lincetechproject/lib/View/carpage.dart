import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Controller/carprovider.dart';
import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';

///Page to add a car to the database
class CarPage extends StatelessWidget {
  ///Car page constructor
  const CarPage({Key? key}) : super(key: key);

  ///Widget age to add a car
  @override
  Widget build(BuildContext context) {

    final dropValue = ValueNotifier('');

    final dropValue2 = ValueNotifier('');

    return Consumer<CarProvider>(builder: (_, car, __) {

      final brandOptions = car.brandList;

      var modelOptions = car.modelList;

      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            clipPathWidget(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          margin: const EdgeInsets.only(
                              top: 30.00,
                              right: 20.00,
                              left: 20.00,
                              bottom: 10.00),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.plate,
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                )),
                            controller: car.controllerPlate,
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.only(
                              top: 10.00,
                              left: 20.00,
                              right: 20.00,
                              bottom: 20.00),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.driver,
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                )),
                            controller: car.controllerDriver,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 132, 60),
                            ),
                            onPressed: () async {
                              if (car.controllerPlate.text != '') {
                                await car.takePicture();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(AppLocalizations.of(context)!
                                        .insertCarPlate),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.takePicture,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: FutureBuilder(
                  future: brandOptions,
                  builder: (context, snapshot) {
                    return ValueListenableBuilder(
                        valueListenable: dropValue,
                        builder: (context, value, _) {
                          final brand = snapshot.data;

                          return DropdownButton<String>(
                            value: (value.isEmpty) ? null : value,
                            onChanged: (opcao) async {
                              dropValue.value = opcao.toString();
                              await car.getModel(dropValue.value);
                            },
                            hint: const Text('Brand'),
                            items: brand
                                ?.map(
                                  (opcao) => DropdownMenuItem<String>(
                                    value: opcao.code,
                                    child: Text(opcao.name!),
                                  ),
                                )
                                .toList(),
                          );
                        });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: FutureBuilder(
                  future: modelOptions,
                  builder: (context, snapshot) {
                    return ValueListenableBuilder(
                        valueListenable: dropValue2,
                        builder: (context, value, _) {
                          final brand2 = snapshot.data;

                          return DropdownButton<String>(
                            value: (value.isEmpty) ? null : value,
                            onChanged: (opcao) =>
                                dropValue2.value = opcao.toString(),
                            hint: const Text('Model'),
                            items: brand2
                                ?.map(
                                  (opcao) => DropdownMenuItem<String>(
                                    value: opcao.name,
                                    child: Text(opcao.name!),
                                  ),
                                )
                                .toList(),
                          );
                        });
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 212, 132, 60),
          onPressed: () async {
            if (File('/data/data/com.example.lincetechproject/'
                    'app_flutter/${car.controllerPlate.text}.png')
                .existsSync()) {
              try {
                await car.add();
                Navigator.pop(context);
              } on Exception {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(AppLocalizations.of(context)!.correctlyData),
                ));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(AppLocalizations.of(context)!.errorPicture),
              ));
            }
          },
          child: const Icon(Icons.add_box),
        ),
      );
    });
  }
}
