import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Controller/carprovider.dart';
import '../Model/stay.dart';

///Card for the ListView builder
Widget cardCar(
    BuildContext context, int index, List<Stay> list, CarProvider car) {

  final stay = list[index];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scrollbar(
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text(DateFormat('dd/MM/yyyy').format(stay.entrydate)),
                        Text(
                          stay.exitdate != null
                              ? DateFormat('dd/MM/yyyy').format(stay.exitdate!)
                              : 'Ainda estacionado',
                        ),
                      ]),
                      Text(
                        stay.totalprice != null
                            ? stay.totalprice!.toString()
                            : 'Ainda n foi',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: const Color.fromARGB(255, 212, 132, 60),
                  ),
                  onPressed: () {
                    car.finisih(stay.licenseplate);
                  },
                  child: const Icon(Icons.car_crash),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
