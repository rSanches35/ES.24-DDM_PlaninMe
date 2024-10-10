import 'package:flutter_test/flutter_test.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:planin_me/app/database/script.dart';

void main() {
  setUpAll(() {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
  });

  group('Teste Script [task AND time_a_day]', () {

    test('Teste Script [task] - CREATE & INSERT', () async {
      var db2 = await openDatabase(inMemoryDatabasePath);
      deleteDatabase(db2.path);

      var db = await openDatabase(inMemoryDatabasePath, version: 1,
          onCreate: (db, version) {
        tableCreate.forEach(db.execute);
        tableInsert.forEach(db.execute);
      });

      var list = await db.rawQuery('SELECT * FROM task');
      expect(list.length, 1);
    });

    test('Teste Script [times_a_day] - CREATE & INSERT', () async {
      var db2 = await openDatabase(inMemoryDatabasePath);
      deleteDatabase(db2.path);

      var db = await openDatabase(inMemoryDatabasePath, version: 1,
          onCreate: (db, version) {
        tableCreate.forEach(db.execute);
        tableInsert.forEach(db.execute);
      });

      var list = await db.rawQuery('SELECT * FROM times_a_day');
      expect(list.length, 3);
    });
  });
}
