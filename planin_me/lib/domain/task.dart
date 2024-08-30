
import 'package:planin_me/domain/times_a_day.dart';

class Task {

  //Attributes
  late dynamic? id;
  late String name;
  late String? description;
  late TimesADay times_a_day;
  late int _priority;
  late bool isActive = true;

  //Methods
  Task({this.id, required this.name, this.description, required this.times_a_day, required priority, this.isActive = true}){ }

  //({this.id, required this.nome, this.descricao, required this.cpf, this.status = 'A'});

  //Task duplicate(){ return '';}
  String share(){ return '';}


  //GETters && SETters
  int get priority => _priority;
  set status(int priority) { if (priority == 1 || priority == 2 || priority == 3) { _priority = _priority;} else { throw Exception('Invalid Priority!');}}
}