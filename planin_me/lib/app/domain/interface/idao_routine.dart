
import 'package:planin_me/app/domain/dto/routine_dto.dart';

abstract class IDAORoutine {

  Future<DTORoutine> save(DTORoutine dto);
  Future<List<DTORoutine>> list();
  Future<DTORoutine> edit(DTORoutine dto);
  void delete(dynamic id);
}
