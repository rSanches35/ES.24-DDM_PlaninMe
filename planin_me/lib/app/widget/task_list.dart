import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/task_form.dart';
import 'package:planin_me/app/application/ap_task.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';

import 'package:planin_me/app/widget/components/nav_bar.dart';
import 'package:planin_me/app/widget/routine_list.dart';

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
        title: Text(
          'Task List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF597FA3),
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
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        elevation: 0.8,
                        child: ExpansionTile(
                          leading: Icon(
                            Icons.insert_invitation_rounded,
                            size: 35,
                          ),
                          title: Text(
                            task.name,
                            style: TextStyle(color: Colors.blueGrey[900], fontSize: 18),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Priority: ',
                                  style: TextStyle(color: Colors.blueGrey[900], fontSize: 16),
                                ),
                                TextSpan(
                                  text: getPriorityText(task.priority),
                                  style: TextStyle(color: getPriorityColor(task.priority), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                task.description ?? 'No description available',
                                style: TextStyle(fontSize: 16, color: Colors.black54),
                              ),
                            ),
                          ],
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
        color: Color.fromARGB(255, 105, 146, 185),
        iconSize: 30,
        onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TaskForm()),
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RoutineList()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const TaskList()),
            );
          } else if (index == 2) {}
        },
      ),
    );
  }
}
