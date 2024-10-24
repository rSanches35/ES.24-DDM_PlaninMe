
class DTORoutine {

  //Attributes
  late dynamic? id;
  late String name;
  late String? description;
  late String code;
  late int isActive = 1;

  //Methods
  DTORoutine({
    this.id,
    required this.name,
    this.description,
    required this.code,
    this.isActive = 1
  });
}