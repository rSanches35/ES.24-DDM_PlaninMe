
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
  TimesADay({required this.dto, required this.dao}){

    id = dto.id;
    week_day = dto.week_day;
    time = dto.time;
    task_id = dto.task_id;
  }

  DTOTimesADay save(DTOTimesADay dto){ return dao.save(dto);}
}
