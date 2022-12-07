///Model for stay
class Stay {
  ///Total price for model Stay
  num? totalprice;

  ///Id for model Stay
  int? id;

  ///Entry Date for model Stay
  DateTime entrydate;

  ///Exit Date for model Stay
  DateTime? exitdate;

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

  ///Function that get and save database finished rows
  Stay.fromDatabaseRowOut(Map<String, Object?> row)
      : id = row['ID'] as int,
        entrydate = DateTime.parse(row['ENTRY_DATE'] as String),
        exitdate = row['EXIT_DATE'] != null
            ? DateTime.parse(row['EXIT_DATE'] as String)
            : null,
        licenseplate = row['LICENSE_PLATE'] as String,
        drivername = row['DRIVER_NAME'] as String,
        totalprice = row['TOTAL_PRICE'] != null
            ? row['TOTAL_PRICE'] as num
            : null;
}
