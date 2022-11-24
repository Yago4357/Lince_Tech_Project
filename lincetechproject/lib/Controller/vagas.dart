import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Vagas with ChangeNotifier {

  Vagas() {
    unawaited(_init());
  }

  int _vacancies = 0;

  final _controller = TextEditingController();

  int get vacancies => _vacancies;

  TextEditingController get controller => _controller;

  String get key => ('vacancy');

  ///Save shared int Vacancy
  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();

    _vacancies = prefs.getInt(key) ?? 0;

    notifyListeners();
  }

  ///Get shared int Vacancy
  Future<void> getShared() async {

    final text = controller.text;
    final vagas = int.tryParse(text) ?? 0;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, vagas);

    _vacancies = vagas;

    notifyListeners();
  }
}