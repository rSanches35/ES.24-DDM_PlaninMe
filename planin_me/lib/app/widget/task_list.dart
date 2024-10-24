import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routes.dart';

import 'package:planin_me/app/widget/task_form.dart';
import 'package:planin_me/app/application/ap_task.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/widget/task_details.dart';


class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  Future<List<DTOTask>> consult() async {
    APTask apTask = APTask();
    return await apTask.list();
  }

  String getPriorityText(int priority) {
    switch (priority) {
      case 1: return 'Low';
      case 2: return 'Medium';
      case 3: return 'High';
      default: return 'Unknown';
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1: return Colors.green;
      case 2: return Colors.amber;
      case 3: return Colors.red;
      default: return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        backgroundColor: Colors.cyan[300],
      ),
      body: Container(
        color: Colors.grey[200],
        child: FutureBuilder(
          future: consult(),
          builder: (BuildContext context, AsyncSnapshot<List<DTOTask>> snapshot) {
            var dataList = snapshot.data;
            if (dataList == null) {
              return Center(child: Text('Data not Found'));
            } else {
              List<DTOTask> list = dataList;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var task = list[index];
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        elevation: 0.8,
                        child: ListTile(
                          leading: Icon(
                            Icons.insert_invitation_rounded,
                            size: 35,
                          ),
                          title: Text(
                            task.name,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Priority: ',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text: getPriorityText(task.priority),
                                  style: TextStyle(color: getPriorityColor(task.priority), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.pushNamed(context,
                                Routes.taskUpdateForm,
                                arguments: task
                              );
                            },
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TaskDetails()),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
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
