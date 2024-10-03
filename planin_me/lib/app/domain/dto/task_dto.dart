
class DTOTask {

  //Attributes
  late dynamic? id;
  late String name;
  late String? description;
  late int priority;
  late bool isActive = true;

  //Methods
  DTOTask({
    this.id,
    required this.name,
    this.description,
    required this.priority,
    this.isActive = true
  });
}