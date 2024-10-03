
class DTOTimesADay {

  //Attributes
  late dynamic? id;
  late String week_day;
  late String time;
  late int task_id;

  //Methods
  DTOTimesADay({
    this.id,
    required this.week_day,
    required this.time,
    required this.task_id
  });
}