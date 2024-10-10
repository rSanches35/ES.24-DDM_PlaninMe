
import 'package:planin_me/app/domain/interface/idao_task.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';

class Task {

  //Attributes
  late dynamic id;
  late String name;
  late String? description;
  late int priority;
  late int isActive = 1;

  late DTOTask dto;
  late IDAOTask dao;

  //Methods
  Task({required this.dao});

  validate({required DTOTask dto}){

    id = dto.id;
    name = dto.name;
    description = dto.description;
    priority = dto.priority;
    isActive = dto.isActive;
  }

  Future<DTOTask> save(DTOTask dto) async {
    
    validate(dto: dto);
    return dao.save(dto);
  }
  Future<List<DTOTask>> list() async {return dao.list();}
  Future<DTOTask> edit(DTOTask dto) async {return dao.edit(dto);}
  void delete(dynamic id) async {dao.delete(id);}
}