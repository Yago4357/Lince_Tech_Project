import 'dart:async';

import 'package:sqflite/sqflite.dart';
import '../Model/price.dart';
import '../Model/stay.dart';

const _dbVersion = 2;

///Class for Database
class DatabaseStay {
  ///Database init
  DatabaseStay() {
    unawaited(init());
  }

  ///Variable for database
  late Database db;

  ///Function that init the database
  Future<void> init() async {

    final databasePath = await getDatabasesPath();
    final path = '$databasePath/demo.db';

    db = await openDatabase(path, version: _dbVersion,
        onCreate: (database, version) async {
          await database.execute('''CREATE TABLE Car(
          ID INTEGER NOT NULL,
          ENTRY_DATE TEXT,
          EXIT_DATE	TEXT,
          LICENSE_PLATE	TEXT NOT NULL UNIQUE,
          DRIVER_NAME	TEXT NOT NULL,
          TOTAL_PRICE	INTEGER,
          PRIMARY KEY(ID AUTOINCREMENT));''');
      await database.execute('''CREATE TABLE price( 
          ID INTEGER NOT NULL, 
          PARKING_LANE TEXT, 
          PRICE DOUBLE, 
          INITIAL_RANGE INTEGER, 
          END_RANGE INTEGER, 
          PRIMARY KEY(ID AUTO INCREMENT)''');
    });
  }

  ///Function that insert initial datas in table price
  Future<void> insertPrice(List<Price> list) async {

    for (final price in list) {
      await db.insert('price', {
        'PARKING_LANE': price.parkingLane,
        'PRICE': price.price,
        'INITIAL_RANGE': price.initialRange,
        'END_RANGE': price.endRange,
      });
    }
  }

  ///Function that insert initial datas in table car
  Future<void> insertIn(List<Stay> list) async {

    for (final stay in list) {
      await db.insert('Car', {
        'ENTRY_DATE': stay.entrydate.toString(),
        'LICENSE_PLATE': stay.licenseplate,
        'DRIVER_NAME': stay.drivername,
      });
    }
  }

  ///Function that insert final datas in database
  Future<void> insertOut(List<Stay> list) async {

    for (final stay in list) {
      await db.update(
        'Car',
        {
          'EXIT_DATE': stay.exitdate.toString(),
          'TOTAL_PRICE': stay.totalprice,
        },
        where: 'LICENSE_PLATE = ?',
        whereArgs: [stay.licenseplate],
      );
    }
  }

  ///Function that get all finished row in database
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

  ///Function that get all not finished rows in database
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

  ///Function that delete a row in database
  Future<void> delete(List<Stay> list) async {


    for (final stay in list) {
      await db.delete(
        'Car',
        where: 'LICENSE_PLATE = ?',
        whereArgs: [stay.licenseplate],
      );
    }
  }

  Future<List<Price>> getPrices() async {

    final rows = await db.query('price', columns: [
      'PARKING_LANE',
      'PRICE',
      'INITIAL_RANGE',
      'END_RANGE',
    ]);

    final list = <Price> [];
    for (final row in rows) {
      list.add(Price.fromDatabaseRowOut(row));
    }

    return list;

  }
}
