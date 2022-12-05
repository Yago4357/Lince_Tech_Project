import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../Model/stay.dart';
import 'database.dart';

///Price provider
class CarProvider extends ChangeNotifier {
  ///Constructor of CarProvider
  CarProvider() {
    helper;
    unawaited(init());
    add();
  }

  ///Helper of Database
  final helper = DatabaseStay();

  final _controllerPlate = TextEditingController();
  final _controllerDriver = TextEditingController();

  ///Getter for Plate controller
  TextEditingController get controllerPlate => _controllerPlate;

  ///Getter for Driver name controller
  TextEditingController get controllerDriver => _controllerDriver;

  final ImagePicker _picker = ImagePicker();

  List<Stay> _stayList = [
    Stay(DateTime.now(), 'JDSK0123', 'Guilherme'),
    Stay(DateTime.now(), 'JDSK2123', 'Amabili'),
    Stay(DateTime.now(), 'JDSK2123', 'João'),

  ];

  ///Getter of StayList
  List<Stay> get stayList => _stayList;

  ///Init of CarProvider
  Future<void> init() async {

    DatabaseStay();

    _stayList = await helper.getAllNotFinished();

    notifyListeners();
  }

  ///Function add in the Database
  void add() async {
    helper.init;

    String? plate = controllerPlate.text;
    String? driver = controllerDriver.text;

    await helper.insertIn([
      Stay(
        DateTime.now(),
        plate,
        driver,
      )
    ]);

    notifyListeners();
  }

  ///Function that get all from Database
  void getAll() async {
    helper.init;

    final stayListBd = await helper.getAllFinished();
    for (final stay in stayListBd) {
      _stayList.add(stay);
    }

    notifyListeners();
  }

  ///Function that delete from Database
  void delete() async {
    helper.init;

    await helper.delete(_stayList);
  }

  ///Function to take a picture with cellphone
  void takePicture() async {

    ///Variable for take License Plate name
    final plateName = controllerPlate.text;

    final photo = await _picker.pickImage(source: ImageSource.camera);

    final photoPath = File(
      photo!.path,
    );

    final path = await getApplicationDocumentsDirectory();

    if (kDebugMode) {
      print('PATH >> ${path.path}');
    }

    final newImage = await photoPath.copy('${path.path}/$plateName.png');

    if (kDebugMode) {
      print(' OLHA AQUI ${newImage.path}');
    }
  }
}
