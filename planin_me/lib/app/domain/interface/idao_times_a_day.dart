
import 'package:planin_me/app/domain/dto/times_a_day_dto.dart';

abstract class IDAOTimesADay {

  Future<DTOTimesADay> save(DTOTimesADay dto);
  Future<List<DTOTimesADay>> list();
  Future<DTOTimesADay> edit(DTOTimesADay dto);
  void delete(dynamic id);
}
