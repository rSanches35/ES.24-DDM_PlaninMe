
import 'package:planin_me/app/domain/interface/idao_routine.dart';
import 'package:planin_me/app/domain/dto/routine_dto.dart';

class Routine {

  //Attributes
  late dynamic id;
  late String name;
  late String? description;
  late String code;
  late int isActive = 1;

  late DTORoutine dto;
  late IDAORoutine dao;

  //Methods
  Routine({required this.dao});

  fill({required DTORoutine dto}){

    id = dto.id;
    name = dto.name;
    description = dto.description;
    code = dto.code;
    isActive = dto.isActive;
  }

  Future<DTORoutine> save(DTORoutine dto) async {
    
    fill(dto: dto);
    return dao.save(dto);
  }

  Future<List<DTORoutine>> list() async {return dao.list();}
  Future<DTORoutine> edit(DTORoutine dto) async {return dao.edit(dto);}
  void delete(dynamic id) async {dao.delete(id);}
}