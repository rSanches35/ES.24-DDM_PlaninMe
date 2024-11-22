import 'package:flutter/material.dart';
import 'package:planin_me/app/domain/dto/routine_dto.dart';
import 'package:planin_me/app/application/ap_routine.dart';
import 'package:planin_me/app/widget/routine_form.dart';

import 'package:planin_me/app/widget/components/nav_bar.dart';
import 'package:planin_me/app/widget/task_list.dart';

class RoutineList extends StatelessWidget {
  const RoutineList({Key? key}) : super(key: key);

  Future<List<DTORoutine>> consult() async {
    APRoutine apRoutine = APRoutine();
    return await apRoutine.list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Routine List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF597FA3),
      ),
      body: Container(
        color: Colors.grey[200],
        child: FutureBuilder(
          future: consult(),
          builder: (BuildContext context, AsyncSnapshot<List<DTORoutine>> snapshot) {
            var dataList = snapshot.data;
            if (dataList == null) {
              return Center(child: Text('Data not Found'));
            } else {
              List<DTORoutine> list = dataList;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var routine = list[index];
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        elevation: 0.8,
                        child: ExpansionTile(
                          leading: Icon(
                            Icons.insert_invitation_rounded,
                            size: 35,
                          ),
                          title: Text(
                            routine.name,
                            style: TextStyle(color: Colors.blueGrey[900], fontSize: 18),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Code: ',
                                  style: TextStyle(color: Colors.blueGrey[900], fontSize: 16),
                                ),
                                TextSpan(
                                  text: routine.code,
                                  style: TextStyle(color: Colors.blueGrey[900], fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                routine.description ?? 'No description available',
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
          context, MaterialPageRoute(builder: (context) => const RoutineForm()),
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const RoutineList()),
            );
          } else if (index == 1) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const TaskList()),
            );
          } else if (index == 2) {}
        },
      ),
    );
  }
}
