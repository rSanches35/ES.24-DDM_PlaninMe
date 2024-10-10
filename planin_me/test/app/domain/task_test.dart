import 'package:flutter_test/flutter_test.dart';

import 'package:planin_me/app/domain/interface/idao_task.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/domain/task.dart';

void main() {
  //Attributes
  late Task task;
  late DTOTask dto;
  //late DAOTaskFake dao;

  group(['GROUP_Description'], () {
    setUp(() {
      //dao = DAOTaskFake();
    });

    test('TEST_Description', () {

      dto = DTOTask(name: "Test", priority: 2);
      //task = Task(dto: dto, dao: dao);

      //expect(() => task.save(dto), returnsNormally);
    });
  });
}

//DAOFake
/*
class DAOTaskFake implements IDAOTask {
  @override
  DTOTask save(DTOTask dto) {
    return dto;
  }
}
*/
