import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Controller/carprovider.dart';
import '../Model/stay.dart';
import '../Widgets/waveclipper.dart';
import '../Widgets/drawer.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key, this.stay, this.carro}) : super(key: key);

  final Stay? stay;

  final CarProvider? carro;

  ///Page to show the car stats
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: BackgroundWaveClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 132, 60),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                          strokeAlign: StrokeAlign.center),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                          strokeAlign: StrokeAlign.center),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Brazil',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '12345',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 38,
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  stay?.drivername != null
                      ? 'Motorista:\n${stay!.drivername}'
                      : 'Não encontrado',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      stay?.entrydate != null
                          ? ('Hora de Entrada:\n${DateFormat('dd/MM/yyyy')
                          .format(stay!.entrydate)}')
                          : 'Não estacionado',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      stay?.exitdate != null
                          ? ('Hora de saída:\n ${DateFormat('dd/MM/yyyy')
                          .format(stay!.exitdate!)}')
                          : 'Ainda\n Estacionado',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Text(
                  stay?.totalprice != null
                      ? 'Preço total: \n R\$ ${stay!.totalprice}'
                      : '',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 60),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: const Color.fromARGB(255, 212, 132, 60),
              ),
              onPressed: () => carro!.finisih(stay!.licenseplate),
              child: const Text('Finalizar Estadia'),
            ),
          ),
        ]),
      ),
    );
  }
}
