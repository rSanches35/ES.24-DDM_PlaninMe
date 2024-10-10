
class DTOTask {

  //Attributes
  late dynamic? id;
  late String name;
  late String? description;
  late int priority;
  late int isActive = 1;

  //Methods
  DTOTask({
    this.id,
    required this.name,
    this.description,
    required this.priority,
    this.isActive = 1
  });
}