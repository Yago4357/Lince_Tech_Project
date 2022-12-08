import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../Model/stay.dart';
import 'database.dart';
import 'priceprovider.dart';
import 'vacancies.dart';

///Car provider
class CarProvider extends ChangeNotifier {
  ///Car provider constructor
  CarProvider() {
    init();
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

  final List<Stay> _stayList = [];

  ///Available parking lots
  int available = 0;

  ///Getter of StayList
  List<Stay> get stayList => _stayList;

  ///Init of CarProvider
  void init() async {
    await helper.init();

    _stayList.clear();

    notifyListeners();
  }

  ///Function add in the Database
  Future<void> add() async {
    await helper.init();

    String? plate = controllerPlate.text;
    String? driver = controllerDriver.text;

    await helper.insertIn(Stay(
      DateTime.now(),
      plate,
      driver,
    ));

    getAll();
  }

  ///Function to set the car out
  void finisih(String plate) async {
    await helper.init();

    var exit = DateTime.now().toString();

    await helper.insertOut(exit, plate);

    await setPrice(plate);
  }

  ///Function that get all from Database
  void getAll() async {
    print('foi');

    await helper.init();

    _stayList.clear();

    var _vacancies = Vacancies().vacancies;

    available = _vacancies - _stayList.length;

    var stayListBd2 = await helper.getAllFinished();
    for (final stay in stayListBd2) {
      _stayList.add(stay);
    }
  }

  ///Function to take a picture with cellphone
  Future<File> takePicture() async {
    await helper.init();

    ///Variable for take License Plate name
    final plateName = controllerPlate.text;

    final photo = await _picker.pickImage(source: ImageSource.camera);

    final photoPath = File(
      photo!.path,
    );

    final path = await getApplicationDocumentsDirectory();

    final newImage = await photoPath.copy('${path.path}/$plateName.png');

    return newImage;
  }

  Future<Image> getPicture(String plateName) async {
    final path = await getApplicationDocumentsDirectory();

    final image = await Image(
      image: AssetImage('$path/$plateName'),
    );

    return image;
  }

  ///Function to set Price
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
        ? permanencia = list.exitdate!.difference(list.entrydate).inHours !=
                null
            ? list.exitdate!.difference(list.entrydate).inHours
            : 0
        : null;

    var precototal = 0.0;

    var a = await PriceProvider().getPrice();

    if (permanencia != null) {
      for (final preco in a) {
        if (preco.initialRange <= permanencia &&
            preco.endRange >= permanencia) {
          precototal = double.parse(preco.priceP.toString());
        }
      }

      await helper.insertTotalPrice(precototal, plate);

      notifyListeners();
    }
  }
}
