import 'package:flutter/material.dart';

import 'package:planin_me/app/application/ap_task.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';

import 'package:planin_me/app/widget/components/nav_bar.dart';
import 'package:planin_me/app/widget/routine_list.dart';
import 'package:planin_me/app/widget/task_list.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _priorityController = TextEditingController();

    void _createTask() async {
      final name = _nameController.text;
      final description = _descriptionController.text;
      final priority = _priorityController.text;
      final isActive = 1;

      DTOTask dto = DTOTask(
          name: name,
          description: description,
          priority: int.parse(priority).toInt(),
          isActive: isActive);

      APTask apTask = APTask();
      await apTask.save(dto);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Create',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF597FA3),
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
            SizedBox(
              height: 24,
            ),
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
                    backgroundColor: Color.fromARGB(255, 105, 146, 185),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RoutineList()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TaskList()),
            );
          } else if (index == 2) {}
        },
      ),
    );
  }
}
