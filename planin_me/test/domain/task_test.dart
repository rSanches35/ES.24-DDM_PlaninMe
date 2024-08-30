
import 'package:flutter_test/flutter_test.dart';

import 'package:planin_me/domain/interface/idao_task.dart';
import 'package:planin_me/domain/dto/task_dto.dart';
import 'package:planin_me/domain/task.dart';

void main() {

  //Attributes
  late Task task;
  late DTOTask dto;
  late DAOTaskFake dao;
}

//DAOFake
class DAOTaskFake implements IDAOTask {
  
  @override
  DTOTask save(DTOTask dto) {return dto;}
}