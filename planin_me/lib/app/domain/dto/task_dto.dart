
import 'package:planin_me/app/domain/times_a_day.dart';

class DTOTask {

  //Attributes
  late dynamic? id;
  late String name;
  late String? description;
  late TimesADay times_a_day;
  late int priority;
  late bool isActive = true;

  //Methods
  DTOTask({
    this.id,
    required this.name,
    this.description,
    required this.times_a_day,
    required this.priority,
    this.isActive = true
  });
}