import 'package:flutter/cupertino.dart';
import '../Model/price.dart';
import 'database.dart';

///Provider for price
class PriceProvider extends ChangeNotifier {

  ///Price provider constructor
  PriceProvider(){
    init();
  }

  ///List of Prices
  List<Price> prices = [
    Price('Faixa 0', 4.00, 0, 1),
    Price('Faixa 1', 3.75, 1, 4),
    Price('Faixa 2', 3.50, 4, 8),
    Price('Fauxa 3', 8.00, 8, 24)
  ];

  ///Helper of Database
  final helper = DatabaseStay();

  ///Initial function of the provider
  void init() async {

    await helper.insertPrice(prices);

    notifyListeners();
  }

  ///Function to get the Prices
  void getPrice() async {

    prices = await helper.getPrices();

    notifyListeners();
  }

}
