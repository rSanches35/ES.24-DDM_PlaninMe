import 'package:planin_me/app/database/sqlite/connection.dart';
import 'package:sqflite/sqflite.dart';

import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/domain/interface/idao_task.dart';

class DAOTaskImpl implements IDAOTask {

  //Attributes
  late Database database;
  final String saveSQL = '''INSERT INTO task (name, description, priority, isActive) VALUES (?, ?, ?, ?)''';
  final String listSQL = '''SELECT * FROM task''';
  final String updateSQL = '''UPDATE task SET name = ?, description = ?, priority = ?, isActive = ? WHERE id = ?''';
  final String deleteSQL = '''DELETE FROM task WHERE id = ?''';

  //Method - Save
  @override
  Future<DTOTask> save(DTOTask dto) async {

    database = await Connection.open();
    int id = await database.rawInsert(
      saveSQL, [
        dto.name,
        dto.description,
        dto.priority,
        dto.isActive
      ]
    );
    dto.id = id;

    return dto;
  }

  //Method - ListALL
  @override
  Future<List<DTOTask>> list() async {

    database = await Connection.open();

    return database.rawQuery(listSQL).then((value) {

      print(value);

      return value.map((e) => DTOTask(
        id: int.parse(e['id'].toString()),
        name: e['name'] as String,
        description: e['description'] as String,
        priority: int.parse(e['priority'].toString()),
        isActive: int.parse(e['isActive'].toString())))
      .toList();
    });
  }

  //Method - Edit
  @override
  Future<DTOTask> edit(DTOTask dto) async {

    database = await Connection.open();
    await database.rawUpdate(
      updateSQL, [
        dto.name,
        dto.description,
        dto.priority,
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