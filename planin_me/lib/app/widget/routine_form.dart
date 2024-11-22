import 'package:flutter/material.dart';

import 'package:planin_me/app/application/ap_routine.dart';
import 'package:planin_me/app/domain/dto/routine_dto.dart';

class RoutineForm extends StatelessWidget {
  const RoutineForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _codeController = TextEditingController();

    void _createRoutine() async {
      final name = _nameController.text;
      final description = _descriptionController.text;
      final code = _codeController.text;
      final isActive = 1;

      DTORoutine dto = DTORoutine(
          name: name,
          description: description,
          code: code,
          isActive: isActive
      );

      APRoutine apRoutine = APRoutine();
      await apRoutine.save(dto);
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
                controller: _codeController,
                key: Key('Code'),
                decoration: InputDecoration(labelText: 'Code'),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: _createRoutine,
                  child: Text('Create Routine'),
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
    );
  }
}
