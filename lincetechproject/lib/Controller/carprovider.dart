import 'package:flutter/cupertino.dart';

import '../Model/stay.dart';
import 'demodb.dart';

///Price provider
class CarProvider extends ChangeNotifier{

  CarProvider();

  final helper = DatabaseHelper();

  List<Stay> _stayList = [];

  final _controllerPlate = TextEditingController();
  final _controllerDriver = TextEditingController();
  final _controllerPrice = TextEditingController();

  get controllerPlate => _controllerPlate;
  get controllerDriver => _controllerDriver;
  get controllerPrice => _controllerPrice;

  List<Stay> get stayList => _stayList;

  void teste() async{

    helper.init;

    await helper.insertIn([Stay(DateTime.now(), '1234DEU', 'Jorge amado')]);

    final stayListBd = await helper.getAll();
    print(stayListBd);
    for(final stay in stayListBd){
      print('uau');
      _stayList.add(stay);
    }

    notifyListeners();
}
}