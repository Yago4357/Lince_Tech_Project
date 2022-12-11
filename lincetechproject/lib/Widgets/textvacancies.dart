import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/vacancies.dart';

///Widget text to take the vacancies number
@override
Widget textVacancies(BuildContext context) {

  final state = Provider.of<Vacancies>(context);

  return Center(
    child: TextFormField(
      controller: state.controller,
    ),
  );
}