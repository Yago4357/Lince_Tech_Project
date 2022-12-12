import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/brand.dart';
import '../Model/carmodel.dart';
import '../Model/stay.dart';
import '../View/pdfreader.dart';
import 'database.dart';
import 'priceprovider.dart';

///Car provider
class CarProvider extends ChangeNotifier {
  ///Car provider constructor
  CarProvider() {
    init();
    unawaited(getAll());
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

  ///Variable to wait time to reload the page
  late bool load;

  ///List of stay
  final List<Stay> _stayList = [];

  ///Available parking lots
  int available = 0;

  ///Varaible to take the brand list
  Future<List<Brand>>? _brandList;

  ///Function to get the brand list
  Future<List<Brand>>? get brandList => _brandList;

  ///Getter of model list
  List<CarModel>? _modelList;

  ///Getter of model list
  Future<List<CarModel>?> get modelList async => _modelList;

  ///Getter of StayList
  List<Stay> get stayList => _stayList;

  ///Init of CarProvider
  void init() async {
    await helper.init();

    _stayList.clear();

    _brandList = getBrand();

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

    await getAll();
  }

  ///Function to set the car out
  Future<void> finish(String plate) async {
    var exit = DateTime.now();

    load = true;

    notifyListeners();

    await helper.insertOut(exit, plate);

    await setPrice(exit, plate);

    await getAll();

    load = false;

    notifyListeners();
  }

  ///Function that get all from Database
  Future<void> getAll() async {
    await helper.init();

    stayList.clear();

    var stayListBd = await helper.getAllFinished();
    for (final stay in stayListBd) {
      _stayList.add(stay);
    }

    await getAvailable();

    notifyListeners();
  }

  ///Function to get the available vacancies
  Future<void> getAvailable() async {
    final prefs = await SharedPreferences.getInstance();

    var vacancies = prefs.getInt('vacancy') ?? 0;

    var used = _stayList.where((element) => element.exitdate == null).length;

    available = vacancies - used;
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

  ///Function to get the picture from license plate
  Future<Image> getPicture(String plateName) async {
    final path = await getApplicationDocumentsDirectory();

    final image = Image(
      image: AssetImage('$path/$plateName'),
    );

    return image;
  }

  ///Function to set Price
  Future<void> setPrice(DateTime exit, String plate) async {
    var precototal = 0.0;

    final list =
        _stayList.firstWhere((element) => element.licenseplate == plate);

    int? permanencia;

    permanencia = exit.difference(list.entrydate).inHours;

    var a = await PriceProvider().getPrice();

    for (final preco in a) {
      if (preco.initialRange <= permanencia && preco.endRange >= permanencia) {
        precototal = double.parse(preco.priceP.toString());
      }

      await helper.insertTotalPrice(precototal, plate);
    }
    notifyListeners();
  }

  ///Function to create a document pdf
  void createPdf(
    BuildContext context,
    String licenseplate,
    String drivername,
    String entry,
    String exit,
    String price,
    String imagePath,
  ) async {
    var pdf = pd.Document(deflate: zlib.encode);

    pdf.addPage(pd.MultiPage(
      mainAxisAlignment: pd.MainAxisAlignment.center,
      build: (context) => [
        pd.Table.fromTextArray(data: <List<String>>[
          <String>[
            'Placa',
            'Motorista',
            'Hora de entrada',
            'Hora de Saída',
            'Preço Total'
          ],
          [licenseplate, drivername, entry, exit, price]
        ]),
      ],
    ));

    final dir = (await getApplicationDocumentsDirectory()).path;

    final path = '$dir/$licenseplate.pdf';

    final file = File(path);

    file.writeAsBytesSync(await pdf.save());

    final pdfController = PdfController(
      document: PdfDocument.openFile('$dir/$licenseplate.pdf'),
    );

    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfReader(pdf: pdfController),
        ));
  }

  ///Function to get brand
  Future<List<Brand>> getBrand() async {
    var uri = Uri.http('parallelum.com.br', '/fipe/api/v2/cars/brands');

    final future = await http.get(uri);

    var list = jsonDecode(future.body);

    var map = {for (var item in list) item['name']: item['code']};

    var list2 = <Brand>[];

    map.entries
        .map((e) => list2.add(Brand(name: e.key, code: e.value)))
        .toList();

    return list2;
  }

  ///Function to get model
  Future<void> getModel(String brandId) async {
    var uri = Uri.http(
        'parallelum.com.br', '/fipe/api/v2/cars/brands/$brandId/models');

    final future = await http.get(uri);

    var list = jsonDecode(future.body);

    var map = {for (var item in list) item['name']: item['code']};

    var list2 = <CarModel>[];

    map.entries
        .map((e) => list2.add(CarModel(name: e.key, code: e.value)))
        .toList();

    _modelList = list2;

    print(12345678910);

    notifyListeners();
  }
}
