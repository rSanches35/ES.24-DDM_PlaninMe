
import 'package:planin_me/app/domain/interface/idao_task.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/domain/times_a_day.dart';

class Task {

  //Attributes
  late dynamic id;
  late String name;
  late String? description;
  late TimesADay times_a_day;
  late int _priority;
  late bool isActive = true;

  late DTOTask dto;
  late IDAOTask dao;

  //Methods
  Task({required this.dto, required this.dao}) {

    id = dto.id;
    name = dto.name;
    description = dto.description;
    times_a_day = dto.times_a_day;
    priority = dto.priority;
    isActive = dto.isActive;
  }

  DTOTask save(DTOTask dto){ return dao.save(dto);}

  //Task duplicate(){ return '';}
  String share(){ return '';}

  //GETters && SETters
  int get priority => _priority;
  set priority(int priority) { if (priority == 1 || priority == 2 || priority == 3) { _priority = _priority;}
    else { throw Exception('Invalid Priority!');}}
}