import 'package:flutter_test/flutter_test.dart';
import 'package:planin_me/app/database/sqlite/connection.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:planin_me/app/domain/dao/dao_task_impl.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {

  sqfliteFfiInit();
  setUpAll(() async {

    databaseFactory = databaseFactoryFfi;
    await Connection.open();
  });

  group('TEST_ Task', () {
    late DAOTaskImpl dao;
    late Database db;

    setUp(() async {
      dao = DAOTaskImpl();
      db = await Connection.open();
    });

    test('TEST_ Task Create', () async {

      DTOTask task = DTOTask(
        name: 'Test Task',
        description: 'Task Description',
        priority: 2,
        isActive: 1,
      );

      DTOTask savedTask = await dao.save(task);

      expect(savedTask.id, isNotNull);
      expect(savedTask.name, 'Test Task');
      expect(savedTask.description, 'Task Description');
      expect(savedTask.priority, 2);
      expect(savedTask.isActive, 1);
    });

    test('TEST_ Task List ALL', () async {

      List<DTOTask> tasks = await dao.list();

      expect(tasks, isNotEmpty);
    });

    test('TEST_ Task Update', () async {

      DTOTask task = DTOTask(
        name: 'Test Task',
        description: 'Task Description',
        priority: 2,
        isActive: 1,
      );

      DTOTask savedTask = await dao.save(task);

      savedTask.name = 'Updated Task';
      savedTask.priority = 1;
      DTOTask updatedTask = await dao.edit(savedTask);

      expect(updatedTask.name, 'Updated Task');
      expect(updatedTask.priority, 1);
    });
  });
}
