import 'package:flutter/material.dart';
import 'package:planin_me/app/domain/dto/routine_dto.dart';
import 'package:planin_me/app/application/ap_routine.dart';
import 'package:planin_me/app/widget/routine_form.dart';

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
        title: Text('Routine List'),
        backgroundColor: Colors.cyan[300],
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
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            routine.code
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
          MaterialPageRoute(builder: (context) => const RoutineForm()),
        ),
      ),
    );
  }
}
