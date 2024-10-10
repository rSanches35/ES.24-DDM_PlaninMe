
import 'package:planin_me/app/domain/dto/task_dto.dart';

abstract class IDAOTask {

  Future<DTOTask> save(DTOTask dto);
  Future<List<DTOTask>> list();
  Future<DTOTask> edit(DTOTask dto);
  void delete(dynamic id);
}
