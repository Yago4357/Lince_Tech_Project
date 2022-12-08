import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/price.dart';

///Widget to set the table in Price page
Widget tableWidget(BuildContext context, int index, List<Price> list) {

  final stay = list[index];

  return Table(
    children: [
      TableRow(
        decoration: BoxDecoration(
            border: Border.all(
          color: const Color.fromARGB(255, 212, 132, 60),
              style: BorderStyle.solid
        )),
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
