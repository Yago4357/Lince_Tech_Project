import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Vacancy Model
class Vacancies extends ChangeNotifier {

  ///Define that the _init run before the screen start
  Vacancies() {
    unawaited(_init());
  }

  int _vacancies = 0;

  final _controller = TextEditingController();

  ///Function to get vacancies
  int get vacancies => _vacancies;

  ///Function to get Text controller
  TextEditingController get controller => _controller;

  ///Variable to define SharedPreferences key
  String get key => ('vacancy');

  ///Get shared int Vacancy
  Future<void> _init() async {

    final prefs = await SharedPreferences.getInstance();

    _vacancies = prefs.getInt(key) ?? 0;

    notifyListeners();
  }

  ///Save shared int Vacancy
  Future<void> saveShared() async {

    final text = controller.text;

    ///Int vacancies inside getShared function
    final vacancies = int.tryParse(text) ?? 0;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, vacancies);

    _vacancies = vacancies;

    notifyListeners();
  }
}