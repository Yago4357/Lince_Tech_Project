import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import '../Widgets/clippath.dart';
import '../Widgets/drawer.dart';

///Page to read the pdf
class PdfReader extends StatelessWidget {
  ///Constructor of page for pdf reader
  const PdfReader({required this.pdf, Key? key}) : super(key: key);

  ///Variable to set the pdf controller
  final PdfController pdf;

  @override
  Widget build(BuildContext context) {

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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.65,
            child: PdfView(
              controller: pdf,
            ),
          ),
        ],
      ),
    );
  }
}
