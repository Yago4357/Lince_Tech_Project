import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Controller/incomeprovider.dart';
import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';
import '../Widgets/table.dart';

///Page to show the income per day
class IncomePage extends StatelessWidget {

  ///Income page constructor
  const IncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstController = ScrollController();

    return Consumer<IncomeProvider>(builder: (_, income, __) {
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
                                AppLocalizations.of(context)!.day,
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
                                AppLocalizations.of(context)!.incomePerDay,
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
                  itemCount: income.incomeList.length,
                  itemBuilder: (context, index) =>
                      tableIncomeWidget(context, index, income.incomeList),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
