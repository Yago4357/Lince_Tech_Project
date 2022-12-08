import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/carprovider.dart';
import '../Widgets/drawer.dart';
import '../Widgets/waveclipper.dart';

  Widget carPage(BuildContext context,{ CarProvider? car}) {
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
                    width: 300,
                    height: 240,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 212, 132, 60),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: formText(context, car!),
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 212, 132, 60),
              onPressed: () async {
                await car.add();
                await Navigator.popAndPushNamed(context, '/StayList');
              },
              child: const Icon(Icons.add_box),
            ),
          );
  }

///Widget form to input car
Widget formText(BuildContext context, CarProvider car ) {

  return SizedBox(
    height: MediaQuery.of(context).size.height*0.35,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          margin: const EdgeInsets.only(
              top: 30.00, right: 20.00, left: 20.00, bottom: 10.00),
          child: TextFormField(
            controller: car.controllerPlate,
          ),
        ),
        Card(
          margin: const EdgeInsets.only(
              top: 10.00, left: 20.00, right: 20.00, bottom: 20.00),
          child: TextFormField(
            controller: car.controllerDriver,
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
            onPressed: () {
              car.takePicture();
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
  );
}
