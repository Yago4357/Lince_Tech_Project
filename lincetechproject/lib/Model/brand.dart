///Model fot brand of the car
class Brand {
  ///Name of the brand
  String? name;
  ///Code of the brand
  String? code;

  ///Brand constructor
  Brand({this.name, this.code});

  ///Function to convert json to Brand
  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

}
