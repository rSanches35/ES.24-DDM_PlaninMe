
import 'package:planin_me/app/domain/dao/dao_routine_impl.dart';
import 'package:planin_me/app/domain/dto/routine_dto.dart';
import 'package:planin_me/app/domain/routine.dart';

class APRoutine {

  //Attributes
  late Routine routine;
  late DTORoutine dto;
  late DAORoutineImpl dao;

  //Methods
  APRoutine(){ dao = DAORoutineImpl(); routine = Routine(dao: dao);}

  Future<DTORoutine> save(DTORoutine dto) async {return await routine.save(dto);}
  Future<List<DTORoutine>> list() async {return await routine.list();}
  Future<DTORoutine> edit(DTORoutine dto) async {return await routine.edit(dto);}
  void delete(dynamic id) async {routine.delete(id);}
}