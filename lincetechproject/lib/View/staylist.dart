import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Controller/carprovider.dart';
import '../Widgets/cardcar.dart';
import '../Widgets/drawer.dart';
import '../Widgets/waveclipper.dart';

///Page for the Stay list
class StayList extends StatelessWidget {
  ///Stay List constructor
  StayList({Key? key}) : super(key: key);

  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarProvider(),
      child: Consumer<CarProvider>(builder: (_, carro, __) {
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
              ClipPath(
                clipper: BackgroundWaveClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 132, 60),
                  ),
                ),
              ),
              Expanded(
                child: RawScrollbar(
                  thumbColor: const Color.fromARGB(255, 212, 132, 60),
                  radius: const Radius.circular(20),
                  thickness: 10,
                  thumbVisibility: false,
                  controller: _firstController,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    controller: _firstController,
                    scrollDirection: Axis.vertical,
                    itemCount: carro.stayList.length,
                    itemBuilder: (context, index) =>
                        cardCar(context, index, carro.stayList),
                  ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        backgroundColor:
                            const Color.fromARGB(255, 212, 132, 60),
                      ),
                      onPressed: () async {
                        carro.getAll();
                        await Navigator.pushNamed(context, '/CarPage');
                      },
                      child: Text(
                        'Adicionar novo carro',
                        style: GoogleFonts.poppins(
                            color: Colors.black,fontSize: 15)),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
