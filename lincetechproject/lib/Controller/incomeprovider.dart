import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../Model/income.dart';
import 'database.dart';

///Income provider
class IncomeProvider extends ChangeNotifier {
  ///Income provider constructor
  IncomeProvider(){
    unawaited(init());
    unawaited(getIncome());
  }

  ///Helper of Database
  final helper = DatabaseStay();

  ///List of incomes
  final List<Income> _incomeList = [];

  ///Getter of income list
  List<Income> get incomeList => _incomeList;

  ///Init function of the income provider
  Future<void> init() async {
    await helper.init();
  }

  ///Function to get the income per day
  Future<void> getIncome() async {

    await helper.init();

    _incomeList.clear();

    var incomeListBd = await helper.getIncomeBd();
    for (final income in incomeListBd) {
      _incomeList.add(income);
    }

    notifyListeners();
  }
}
