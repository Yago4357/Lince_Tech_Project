import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'waveclipper.dart';
import '../Controller/carprovider.dart';
import '../Controller/vacancies.dart';

///Widget to set Clip Path appbar
Widget ClipPathWidget(BuildContext context, CarProvider carro, Vacancies vacancies) {
  
      return ClipPath(
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
                  '${carro.available}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
