import 'package:planin_me/app/domain/dao/dao_times_a_day_impl.dart';
import 'package:planin_me/app/domain/dto/times_a_day_dto.dart';
import 'package:planin_me/app/domain/times_a_day.dart';

class APTimesADay {

  //Attributes
  late TimesADay task;
  late DTOTimesADay dto;
  late DaoTimesADayImpl dao;

  //Methods
  APTimesADay(){ dao = DaoTimesADayImpl(); task = TimesADay(dao: dao);}

  Future<DTOTimesADay> save(DTOTimesADay dto) async {return await task.save(dto);}
  Future<List<DTOTimesADay>> list() async {return await task.list();}
  Future<DTOTimesADay> edit(DTOTimesADay dto) async {return await task.edit(dto);}
  void delete(dynamic id) async {task.delete(id);}
}