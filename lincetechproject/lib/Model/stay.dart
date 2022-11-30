class Stay {

  late double total_price;
  late int id;
  DateTime entry_date;
  late DateTime exit_date;
  String license_plate, driver_name;

  Stay(this.entry_date,
      this.license_plate, this.driver_name);

  Stay.fromDatabaseRow(Map<String, Object?> row)
      : id = row['ID'] as int,
        entry_date = row['ENTRY_DATE'] as DateTime,
        exit_date = row['EXIT_DATE'] as DateTime,
        license_plate = row['LICENSE_PLATE'] as String,
        driver_name = row['DRIVER_NAME'] as String,
        total_price = row['TOTAL_PRICE'] as double;

  @override
  toString() => 'Placa = ${this.license_plate}, Data de entrada: ${this.entry_date}';
}
