import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({Key? key}) : super(key: key);

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
        // Implementação da função criar
        print('Name: $name');
        print('Description: $description');
        print('Priority: $priority');
        print('Active: $isActive');
      }

      // Chame a função criar com os dados coletados
      create(name, description, priority, isActive);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Create'),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _createTask,
                  child: Text('Create TASK'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[300],
                    foregroundColor: const Color.fromARGB(255, 36, 35, 35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  