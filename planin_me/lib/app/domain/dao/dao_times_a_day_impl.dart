import 'package:planin_me/app/database/sqlite/connection.dart';
import 'package:sqflite/sqflite.dart';

import 'package:planin_me/app/domain/dto/times_a_day_dto.dart';
import 'package:planin_me/app/domain/interface/idao_times_a_day.dart';

class DaoTimesADayImpl implements IDAOTimesADay {

  //Attributes
  late Database database;
  final String saveSQL = '''INSERT INTO times_a_day (week_day, time, task_id) VALUES (?, ?, ?)''';
  final String listSQL = '''SELECT * FROM times_a_day''';
  final String updateSQL = '''UPDATE times_a_day SET week_day = ?, time = ?, task_id = ? WHERE id = ?''';
  final String deleteSQL = '''DELETE FROM times_a_day WHERE id = ?''';

  //Method - Save
  @override
  Future<DTOTimesADay> save(DTOTimesADay dto) async {

    database = await Connection.open();
    int id = await database.rawInsert(
      saveSQL, [
        dto.week_day,
        dto.time,
        dto.task_id,
      ]
    );
    dto.id = id;

    return dto;
  }

  //Method - ListALL
  @override
  Future<List<DTOTimesADay>> list() async {

    database = await Connection.open();

    return database.rawQuery(listSQL).then((value) {

      print(value);

      return value.map((e) => DTOTimesADay(
        id: int.parse(e['id'].toString()),
        week_day: e['week_day'] as String,
        time: e['time'] as String,
        task_id: int.parse(e['task_id'].toString())))
      .toList();
    });
  }

  //Method - Edit
  @override
  Future<DTOTimesADay> edit(DTOTimesADay dto) async {

    database = await Connection.open();
    await database.rawUpdate(
      updateSQL, [
        dto.week_day,
        dto.time,
        dto.task_id,
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