import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/vacancies.dart';

@override
Widget TextVacancies(BuildContext context) {

  final state = Provider.of<Vacancies>(context);

  return Center(
    child: TextFormField(
      controller: state.controller,
    ),
  );
}