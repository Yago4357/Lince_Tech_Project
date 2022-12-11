import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Controller/vacancies.dart';
import '../Widgets/drawer.dart';
import '../Widgets/waveclipper.dart';

///Page to add a car to the database
class CarPage extends StatelessWidget {

  ///Car page constructor
  const CarPage({Key? key, this.car}) : super(key: key);

  ///Variable for take Car Provider
  final CarProvider? car;

  ///Widget age to add a car
  @override
  Widget build(BuildContext context) {
    final vacancies = Provider.of<Vacancies>(context);

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
          ClipPath(
            clipper: BackgroundWaveClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 212, 132, 60),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vagas Disponiveis: ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      vacancies.vacancies.toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                          controller: car?.controllerPlate,
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(
                            top: 10.00,
                            left: 20.00,
                            right: 20.00,
                            bottom: 20.00),
                        child: TextFormField(
                          controller: car?.controllerDriver,
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
                            if (car?.controllerPlate.text != '') {
                              await car?.takePicture();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Por favor insira a Placa do carro'),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Tirar Foto',
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 212, 132, 60),
        onPressed: () async {
          if (File('/data/data/com.example.lincetechproject/'
                  'app_flutter/${car?.controllerPlate.text}.png')
              .existsSync()) {
            try {
              await car!.add();
              Navigator.pop(context);
            } on Exception {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Insira os dados corretamente'),
              ));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Tire uma foto da placa'),
            ));
          }
        },
        child: const Icon(Icons.add_box),
      ),
    );
  }
}
