
import 'package:planin_me/app/domain/dao/dao_task_impl.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/domain/task.dart';

class APTask {

  //Attributes
  late Task task;
  late DTOTask dto;
  late DAOTaskImpl dao;

  //Methods
  APTask(){ dao = DAOTaskImpl(); task = Task(dao: dao);}

  Future<DTOTask> save(DTOTask dto) async {return await task.save(dto);}
  Future<List<DTOTask>> list() async {return await task.list();}
  Future<DTOTask> edit(DTOTask dto) async {return await task.edit(dto);}
  void delete(dynamic id) async {task.delete(id);}
}