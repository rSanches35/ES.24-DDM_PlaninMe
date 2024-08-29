
import 'package:planin_me/domain/times_a_day.dart';

class Task {

  late String name;
  late String description;
  late TimesADay times_a_day;
  late int priority;
  late bool isActive = true;


  Task(){ }
  
  //Task duplicate(){ return '';}
  String share(){ return '';}
}