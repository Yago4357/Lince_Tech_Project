import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Controller/vacancies.dart';
import '../Widgets/cardcar.dart';
import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';
import 'carpage.dart';

///Page for the Stay list
class StayList extends StatelessWidget {
  ///Stay List constructor
  StayList({Key? key}) : super(key: key);

  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<CarProvider, Vacancies>(
        builder: (_, carro, vacancies, __) {
          carro.getAll();
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const DrawerWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPathWidget(context, carro, vacancies),
            Expanded(
              child: ListView.builder(
                controller: _firstController,
                scrollDirection: Axis.vertical,
                itemCount: carro.stayList.length,
                itemBuilder: (context, index) =>
                    cardCar(context, index, carro),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.00),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: const Color.fromARGB(255, 212, 132, 60),
                    ),
                    onPressed: () async {
                      carro.getAll();
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => carPage(context, car: carro),
                          ));
                    },
                    child: Text('Adicionar novo carro',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15)),
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
