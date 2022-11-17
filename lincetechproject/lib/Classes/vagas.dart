import 'package:flutter/cupertino.dart';

class Vagas with ChangeNotifier{
  int _vagas = 0;

  int get vagas => _vagas;

  void att(value) {
    _vagas = value;
    notifyListeners();
  }

}