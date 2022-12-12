import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Controller/carprovider.dart';
import '../Controller/priceprovider.dart';
import 'waveclipper.dart';

///Widget to set Clip Path appbar
Widget clipPathWidget(BuildContext context) {

  var car = Provider.of<CarProvider>(context);

  return Consumer<PriceProvider>(
      builder: (_, vacancies, __) {
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
                  AppLocalizations.of(context)!.availableVacancies,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${car.available}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ));
  });
}
