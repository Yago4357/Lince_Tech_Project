import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Model/income.dart';
import '../Model/price.dart';

///Widget to set the table in Price page
Widget tablePriceWidget(BuildContext context, int index, List<Price> list) {
  final stay = list[index];

  return Table(
    children: [
      TableRow(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 212, 132, 60),
                style: BorderStyle.solid)),
        children: [
          TableCell(
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  stay.parkingLane,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${stay.initialRange}',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${stay.endRange}',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'R\$ ${stay.priceP}',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

///Widget to set the table in Income page
Widget tableIncomeWidget(BuildContext context, int index, List<Income> list) {
  final income = list[index];

  return Table(
    children: [
      TableRow(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 212, 132, 60),
                style: BorderStyle.solid)),
        children: [
          TableCell(
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.justify,
                  DateFormat(AppLocalizations.of(context)!.dateFormat)
                      .format(DateTime.parse(income.data)),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.justify,
                  '${AppLocalizations.of(context)!.coin} ${income.incomeDay}',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
