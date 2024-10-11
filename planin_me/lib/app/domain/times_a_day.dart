
import 'package:planin_me/app/domain/interface/idao_times_a_day.dart';
import 'package:planin_me/app/domain/dto/times_a_day_dto.dart';

class TimesADay {

  //Attributes
  late dynamic id;
  late String week_day;
  late String time;
  late int task_id;

  late DTOTimesADay dto;
  late IDAOTimesADay dao;

  //Methods
  TimesADay({required this.dao});
  
  fill({required DTOTimesADay dto}) {

    id = dto.id;
    week_day = dto.week_day;
    time = dto.time;
    task_id = dto.task_id;
  }

  Future<DTOTimesADay> save(DTOTimesADay dto) async {
    
    fill(dto: dto);
    return dao.save(dto);
  }

  Future<List<DTOTimesADay>> list() async {return dao.list();}
  Future<DTOTimesADay> edit(DTOTimesADay dto) async {return dao.edit(dto);}
  void delete(dynamic id) async {dao.delete(id);}
}
