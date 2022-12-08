import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Widgets/textvacancies.dart';
import '/Controller/vacancies.dart';
import '../Widgets/drawer.dart';
import '../Widgets/waveclipper.dart';

///Initial Page of myApp
class VacanciesPage extends StatelessWidget {
  ///Variable of vacancies
  final int nvacancies = 0;

  ///Initial Page constructor of myApp
  const VacanciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<Vacancies>(
        builder: (_, vacancies, __) {
          return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(32.0),
                          child: TextVacancies(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 212, 132, 60),
              onPressed: vacancies.saveShared,
              child: const Icon(
                Icons.save,
              ),
            ),
          );
        },
      );
  }
}
