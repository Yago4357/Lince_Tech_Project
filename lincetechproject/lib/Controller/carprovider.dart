import 'package:flutter/cupertino.dart';

import '../Model/stay.dart';
import 'demodb.dart';

///Price provider
class CarProvider extends ChangeNotifier {
  CarProvider() {
    helper;
    init();
    add();
  }

  final helper = DatabaseHelper();

  final _controllerPlate = TextEditingController();
  final _controllerDriver = TextEditingController();

  TextEditingController get controllerPlate => _controllerPlate;
  TextEditingController get controllerDriver => _controllerDriver;



  List<Stay> _stayList = [];

  List<Stay> get stayList => _stayList ;

  void init() async {

   _stayList = await helper.getAllNotFinished();

  }

  void add() async {
    helper.init;

    String? Plate = controllerPlate.text;
    String? Driver = controllerDriver.text;

    await helper.insertIn([
      Stay(
        DateTime.now(),
        Plate,
        Driver,
      )
    ]);

    notifyListeners();
  }

  void getAll() async {

    helper.init;

    final stayListBd = await helper.getAllFinished();
    for (final stay in stayListBd) {
      _stayList.add(stay);
    }

    notifyListeners();

  }

  void delete() async {

    helper.init;

    helper.delete(_stayList);
  }

}
