import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Controller/carprovider.dart';
import '../Model/stay.dart';
import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';
import '../Widgets/waveclipper.dart';

///Page to show the stats of stay
class StatsPage extends StatelessWidget {
  ///StatsPage constructor
  const StatsPage({Key? key, this.stay}) : super(key: key);

  ///Variable to get stay stats
  final Stay? stay;

  ///Page to show the car stats
  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(builder: (_, car, __) {
      var stayCar = car.stayList
          .firstWhere((element) => element.licenseplate == stay?.licenseplate);

      if (car.load == false) {
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
                                AppLocalizations.of(context)!.country,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                stayCar.licenseplate,
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
                      '${AppLocalizations.of(context)!.driver}\n'
                          '${stayCar.drivername}',
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
                          ('${AppLocalizations.of(context)!.entryTime}\n'
                              '${DateFormat('HH:mm:'
                              'ss').format(stayCar.entrydate)}'),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          stayCar.exitdate != null
                              ? ('${AppLocalizations.of(context)!.exitTime}\n '
                              '${DateFormat('HH:mm:'
                                  'ss').format(stayCar.exitdate!)}')
                              : AppLocalizations.of(context)!.parked,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      stayCar.totalprice != null
                          ? '${AppLocalizations.of(context)!.totalPrice}\n '
                          'R\$ ${stayCar.totalprice}'
                          : '',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    File('/data/data/com.example.lincetechproject/'
                                'app_flutter/${stayCar.licenseplate}.png')
                            .existsSync()
                        ? SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              child: Image.file(
                                File('/data/data/com.example.lincetechproject/'
                                    'app_flutter/${stayCar.licenseplate}.png'),
                              ),
                            ))
                        : Text(
                            AppLocalizations.of(context)!.imageNotFound,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 20),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: stay?.exitdate == null
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(220, 60),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor:
                              const Color.fromARGB(255, 212, 132, 60),
                        ),
                        onPressed: () async {
                          await car.finish(stayCar.licenseplate);
                        },
                        child: Text(AppLocalizations.of(context)!.finalizeStay))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(220, 60),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor:
                              const Color.fromARGB(255, 212, 132, 60),
                        ),
                        onPressed: () {
                          car.createPdf(
                              context,
                              stayCar.licenseplate,
                              stayCar.drivername,
                              DateFormat('HH:mm:'
                                  'ss').format(stayCar.entrydate),
                              DateFormat('HH:mm:'
                                  'ss').format(stayCar.exitdate!),
                              stayCar.totalprice.toString(),
                          '/data/data/com.example.lincetechproject/'
                              'app_flutter/${stayCar.licenseplate}.png');
                        },
                        child: Text(AppLocalizations.of(context)!.generatePdf)),
              ),
            ]),
          ),
        );
      } else {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          drawer: const DrawerWidget(),
          body: Column(
            children: [
              clipPathWidget(context),
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Color.fromARGB(255, 212, 132, 60),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
