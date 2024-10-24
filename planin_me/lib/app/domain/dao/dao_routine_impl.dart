import 'package:planin_me/app/database/sqlite/connection.dart';
import 'package:sqflite/sqflite.dart';

import 'package:planin_me/app/domain/dto/routine_dto.dart';
import 'package:planin_me/app/domain/interface/idao_routine.dart';

class DAORoutineImpl implements IDAORoutine {

  //Attributes
  late Database database;
  final String saveSQL = '''INSERT INTO routine (name, description, code, isActive) VALUES (?, ?, ?, ?)''';
  final String listSQL = '''SELECT * FROM routine''';
  final String updateSQL = '''UPDATE routine SET name = ?, description = ?, code = ?, isActive = ? WHERE id = ?''';
  final String deleteSQL = '''DELETE FROM routine WHERE id = ?''';

  //Method - Save
  @override
  Future<DTORoutine> save(DTORoutine dto) async {

    database = await Connection.open();
    int id = await database.rawInsert(
      saveSQL, [
        dto.name,
        dto.description,
        dto.code,
        dto.isActive
      ]
    );
    dto.id = id;

    return dto;
  }

  //Method - ListALL
  @override
  Future<List<DTORoutine>> list() async {

    database = await Connection.open();

    return database.rawQuery(listSQL).then((value) {

      print(value);

      return value.map((e) => DTORoutine(
        id: int.parse(e['id'].toString()),
        name: e['name'] as String,
        description: e['description'] as String,
        code: e['code'] as String,
        isActive: int.parse(e['isActive'].toString())))
      .toList();
    });
  }

  //Method - Edit
  @override
  Future<DTORoutine> edit(DTORoutine dto) async {

    database = await Connection.open();
    await database.rawUpdate(
      updateSQL, [
        dto.name,
        dto.description,
        dto.code,
        dto.isActive,
        dto.id
      ]
    );

    return dto;
  }

  //Method - Delete
  @override
  void delete(dynamic id) async {

    database = await Connection.open();
    database.rawDelete(deleteSQL, [id]);
  }
}