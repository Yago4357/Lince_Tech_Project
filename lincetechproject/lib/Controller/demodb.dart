import 'package:sqflite/sqflite.dart';
import '../Model/stay.dart';

const _dbVersion = 1;

class DatabaseHelper {

  DatabaseHelper(){
    init();
  }

 late Database db;

  void init() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/demo.db';

    db = await openDatabase(path, version: _dbVersion,
        onCreate: (Database database, int version) async {
      await database.execute('''CREATE TABLE Car(
          ID INTEGER NOT NULL,
          ENTRY_DATE TEXT,
          EXIT_DATE	TEXT,
          LICENSE_PLATE	TEXT NOT NULL UNIQUE,
          DRIVER_NAME	TEXT NOT NULL,
          TOTAL_PRICE	INTEGER,
          PRIMARY KEY(ID AUTOINCREMENT));''');
    });
  }

  Future<void> insertIn(List<Stay> _list) async {
    for (final stay in _list) {
      await db.insert('Car', {
        'ENTRY_DATE': stay.entry_date.toString(),
        'LICENSE_PLATE': stay.license_plate,
        'DRIVER_NAME': stay.driver_name,
      });
    }
  }

  Future<void> insertOut(List<Stay> _list) async {
    for (final stay in _list) {
      await db.update(
        'Car',
        {
          'EXIT_DATE': stay.exit_date.toString(),
          'TOTAL_PRICE': stay.total_price,
        },
        where: 'LICENSE_PLATE = ?',
        whereArgs: [stay.license_plate],
      );
    }
  }

  Future<List<Stay>> getAllFinished() async {
    final rows = await db.query(
      'Car',
      columns: [
        'ID',
        'ENTRY_DATE',
        'LICENSE_PLATE',
        'DRIVER_NAME',
      ],
    );

    final list = <Stay>[];
    for (final row in rows) {
      list.add(Stay.fromDatabaseRowIn(row));
    }

    return list;
  }

  Future<List<Stay>> getAllNotFinished() async {
    final rows = await db.query(
      'Car',
      columns: [
        'ID',
        'ENTRY_DATE',
        'EXIT_DATE',
        'LICENSE_PLATE',
        'DRIVER_NAME',
        'TOTAL_PRICE'
      ],
    );

    final list = <Stay>[];
    for (final row in rows) {
      list.add(Stay.fromDatabaseRowOut(row));
    }

    return list;
  }

  Future<void> delete(List<Stay> _list) async {
    for (final stay in _list) {
      await db.delete(
        'Car',
        where: 'LICENSE_PLATE = ?',
        whereArgs: [stay.license_plate],
      );
    }
  }
}
