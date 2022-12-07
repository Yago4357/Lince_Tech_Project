import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../Model/stay.dart';
import 'database.dart';
import 'priceprovider.dart';

///Price provider
class CarProvider extends ChangeNotifier {

  CarProvider(){
    init;
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

  List<Stay> _stayList = [];

  ///Getter of StayList
  List<Stay> get stayList => _stayList;

  ///Init of CarProvider
  Future<void> init() async {

    await helper.init();

    _stayList.clear();

    notifyListeners();
  }

  ///Function add in the Database
  void add() async {
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

  void finisih(String plate) async {
    String exit = DateTime.now().toString();

    await helper.insertOut(exit, plate);

    await setPrice(plate);
  }

  ///Function that get all from Database
  void getAll() async {

    await helper.init();

    _stayList.clear();

    var stayListBd = await helper.getAllFinished();
    for (final stay in stayListBd) {
      _stayList.add(stay);
    }

    var stayListBd2 = await helper.getAllNotFinished();
    for (final stay in stayListBd2) {
      _stayList.add(stay);
    }

    notifyListeners();
  }

  ///Function that delete from Database
  void delete() async {
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
      print('OLHA AQUI ${newImage.path}');
    }
  }

  Future<void> setPrice(String plate) async {

    final list =
        _stayList.firstWhere((element) => element.licenseplate == plate);

    if (kDebugMode) {
      list.exitdate != null
          ? print(list.exitdate?.difference(list.entrydate).inHours)
          : print(list.exitdate?.difference(list.entrydate).inHours);
    }

    int? permanencia;

    list.exitdate != null
        ? permanencia = list.exitdate!.difference(list.entrydate).inHours
        : null;

    var precototal = 0.0;

    if (permanencia != null) {
      print('foi');
      for (final preco in PriceProvider().prices) {
        if (preco.initialRange <= permanencia &&
            preco.endRange >= permanencia) {
          precototal = preco.price;

          if (kDebugMode) {
            print(permanencia);
            print(precototal);
          }
        }
      }

      await helper.insertTotalPrice('$precototal', plate);
    }
  }
}
