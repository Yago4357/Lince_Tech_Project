///Model to car model
class CarModel {

  ///Name of the car model
  String? name;

  ///Code of the car model
  String? code;

  ///Constructor of car model
  CarModel({this.name, this.code});

  ///Function to convert json to CarModel
  CarModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

}