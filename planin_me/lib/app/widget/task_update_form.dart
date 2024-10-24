import 'package:flutter/material.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';

class TaskUpdateForm extends StatelessWidget {

  final DTOTask? task;
  const TaskUpdateForm({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _priorityController = TextEditingController();

    void _createTask() {

      final name = _nameController.text;
      final description = _descriptionController.text;
      final priority = _priorityController.text;
      final isActive = "1";

      void create(String name, String description, String priority, String isActive) {

        print('Name: $name');
        print('Description: $description');
        print('Priority: $priority');
        print('Active: $isActive');
      }

      create(name, description, priority, isActive);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('[TASK name]'),
        backgroundColor: Colors.cyan[300],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: _nameController,
                key: Key('name'),
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            SizedBox(height: 24,),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: _descriptionController,
                key: Key('description'),
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: _priorityController,
                key: Key('priority'),
                decoration: InputDecoration(labelText: 'Priority'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
