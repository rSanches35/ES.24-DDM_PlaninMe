import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:planin_me/app/base/sqlite/script.dart';

class Connexion {
  //Attributes
  static late Database _db;
  static bool conexaoCriada = false;

  //Methods
  static Future<Database> abrir() async {
    if (!conexaoCriada) {
      var path = join(await getDatabasesPath(), 'banco.db');

      _db = await openDatabase(path, version: 1, onCreate: (db, version) {
        tableCreate.forEach(db.execute);
        tableInsert.forEach(db.execute);
      });
      conexaoCriada = true;
    }
    return _db;
  }
}
