import 'package:flutter/cupertino.dart';
import '../Model/price.dart';
import 'database.dart';

class PriceProvider extends ChangeNotifier {

  PriceProvider(){
    init();
  }

  List<Price> prices = [
    Price('Faixa 0', 4.00, 0, 1),
    Price('Faixa 1', 3.75, 1, 4),
    Price('Faixa 2', 3.50, 4, 8),
    Price('Fauxa 3', 8.00, 8, 24)
  ];

  final helper = DatabaseStay();

  Future<void> init() async {

    await helper.insertPrice(prices);

    notifyListeners();
  }

  void getPrice() async {

    prices = await helper.getPrices();

    notifyListeners();
  }

}
