import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Controller/priceprovider.dart';
import '../Widgets/drawer.dart';
import '../Widgets/table.dart';
import '../Widgets/waveclipper.dart';

///Page for prices
class PricePage extends StatelessWidget {
  ///Price constructor
  const PricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstController = ScrollController();

    return Consumer<PriceProvider>(builder: (_, price, __) {
      price.getPrice();
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 212, 132, 60),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26.0, left: 26.0),
              child: Table(
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: const Color.fromARGB(255, 212, 132, 60),
                          )),
                      children: [
                        TableCell(
                          child: SizedBox(
                            height: 60,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Faixa',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 60,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Intervalo\n inicial',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 60,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Intervalo\n final',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: 60,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Preço',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ])
                ],
              ),
            ),
            Expanded(
              child: RawScrollbar(
                thumbColor: const Color.fromARGB(255, 212, 132, 60),
                radius: const Radius.circular(20),
                thickness: 10,
                thumbVisibility: false,
                controller: firstController,
                child: ListView.builder(
                    padding: const EdgeInsets.only(right: 26.0, left: 26.0),
                    controller: firstController,
                    scrollDirection: Axis.vertical,
                    itemCount: price.prices.length,
                    itemBuilder: (context, index) => tableWidget(context, index, price.prices),
                    ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
