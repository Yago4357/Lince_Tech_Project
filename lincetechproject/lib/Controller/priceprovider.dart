import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../Model/price.dart';
import 'database.dart';

///Provider for price
class PriceProvider extends ChangeNotifier {
  ///Price provider constructor
  PriceProvider() {
    init();
    unawaited(getPrice());
  }

  ///List of Prices
  List<Price> prices = [];

  ///Helper of Database
  final helper = DatabaseStay();

  ///Initial function of the provider
  void init() async {

    await helper.init();

    notifyListeners();
  }

  ///Function to get the Prices
  Future<List<Price>> getPrice() async {

    await helper.init();

    prices.clear();

    prices = await helper.getPrices();

    notifyListeners();

    return prices;
  }
}
