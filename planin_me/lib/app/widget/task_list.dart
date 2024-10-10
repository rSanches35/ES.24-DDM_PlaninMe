import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routes.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/widget/task_details.dart';
import 'package:planin_me/app/widget/task_form.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  Future<List<DTOTask>> consult() async {
    return [
      DTOTask(name: 'Wake Up', priority: 3, isActive: true),
      DTOTask(name: 'Feed Neko', priority: 1, isActive: true),
      DTOTask(name: 'Do Laundry', priority: 2, isActive: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        backgroundColor: Colors.cyan[300],
      ),
      body: FutureBuilder(
        future: consult(),
        builder:
          (BuildContext context, AsyncSnapshot<List<DTOTask>> snapshot) {
          var dataList = snapshot.data;
          if (dataList == null) { return Text('Data not Found');}
          else {
            List<DTOTask> list = dataList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var task = list[index];
                return ListTile(
                  leading: Icon(Icons.insert_invitation_rounded),
                  title: Text(task.name),
                  subtitle: Text('Priority: ${task.priority}'),
                  onTap: () => Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const TaskDetails()),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        color: Colors.cyan[700],
        iconSize: 30,
        onPressed: () => Navigator.push( context,
          MaterialPageRoute(builder: (context) => const TaskForm()),
        ),
      ),
    );
  }
}
