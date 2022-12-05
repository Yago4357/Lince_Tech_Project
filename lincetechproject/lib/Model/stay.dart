///Model for stay
class Stay {
  ///Total price for model Stay
  late double totalprice;

  ///Id for model Stay
  late int id;

  ///Entry Date for model Stay
  DateTime entrydate;

  ///Exit Date for model Stay
  late DateTime exitdate;

  ///License plate and driver name for moel Stay
  String licenseplate, drivername;

  ///Stay model constructor
  Stay(this.entrydate, this.licenseplate, this.drivername);

  ///Function that get and save database not finished rows
  Stay.fromDatabaseRowIn(Map<String, Object?> row)
      : id = row['ID'] as int,
        entrydate = DateTime.parse(row['ENTRY_DATE'] as String),
        licenseplate = row['LICENSE_PLATE'] as String,
        drivername = row['DRIVER_NAME'] as String;

  @override
  toString() =>
      'Placa = $licenseplate, Data de entrada: $entrydate\n';

  ///Function that get and save database finished rows
  Stay.fromDatabaseRowOut(Map<String, Object?> row)
      : id = row['ID'] as int,
        entrydate = DateTime.parse(row['ENTRY_DATE'] as String),
        exitdate = DateTime.parse(row['EXIT_DATE'] as String),
        licenseplate = row['LICENSE_PLATE'] as String,
        drivername = row['DRIVER_NAME'] as String,
        totalprice = row['TOTAL_PRICE'] as double;
}
