import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Controller/carprovider.dart';
import '../View/statspage.dart';

///Card for the ListView builder
Widget cardCar(BuildContext context, int index, CarProvider carro) {
  final stay = carro.stayList[index];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              top: 4.0,
            ),
            child: Row(children: [
              Text(
                stay.licenseplate,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(child: Image.asset(
                    '/data/data/com.example.lincetechproject/app_flutter/${stay
                        .licenseplate}.png')),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(stay.drivername,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ]),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat('dd/MM/yyyy').format(stay.entrydate),
                              style: GoogleFonts.poppins(color: Colors.black)),
                          Text(
                              stay.exitdate != null
                                  ? DateFormat('dd/MM/yyyy')
                                      .format(stay.exitdate!)
                                  : 'Ainda estacionado',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              )),
                        ]),
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
                onPressed: () async => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StatsPage(stay: stay, carro: carro))),
                child: const Icon(Icons.car_crash),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
