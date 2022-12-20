import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Controller/vacancies.dart';
import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';

///Initial Screen Class
class HomePage extends StatelessWidget {
  ///Initial Screen Construct
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Vacancies>(builder: (_, vacancies, __) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const DrawerWidget(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            clipPathWidget(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 314,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 144,
                        width: 158,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 132, 60),
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(context, '/PricePage');
                            },
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.pricePerHour,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 144,
                        width: 158,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 132, 60),
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(
                                  context, '/VacanciesPage');
                            },
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.numberOfVacancies,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 158,
                  height: 314,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        backgroundColor:
                            const Color.fromARGB(255, 212, 132, 60),
                      ),
                      onPressed: () async {
                        await Navigator.pushNamed(context, '/StayList');
                      },
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.stayList,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.00),
              width: 346,
              height: 139,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: const Color.fromARGB(255, 212, 132, 60),
                  ),
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/StayList');
                  },
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.income,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}