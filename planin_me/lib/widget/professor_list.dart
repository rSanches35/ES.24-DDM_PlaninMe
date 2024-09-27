import 'package:flutter/material.dart';

import 'package:planin_me/app/domain/dto/task_dto.dart';
import 'package:planin_me/app/domain/times_a_day.dart';

class ProfessorList extends StatelessWidget {
  const ProfessorList({Key? key}) : super(key: key);

  Future<List<DTOTask>> consult() async {
    return [
      DTOTask(
          name: 'Wake Up',
          priority: 1,
          isActive: true,
          times_a_day: TimesADay()),
      DTOTask(
          name: 'Feed Neko',
          priority: 3,
          isActive: true,
          times_a_day: TimesADay()),
      DTOTask(
          name: 'Do Laundry',
          priority: 2,
          isActive: false,
          times_a_day: TimesADay()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: FutureBuilder(
        future: consult(),
        builder: (BuildContext context, AsyncSnapshot<List<DTOTask>> snapshot) {
          var dataList = snapshot.data;
          if (dataList == null) {
            return Text('Data not Found');
          } else {
            List<DTOTask> list = dataList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var task = list[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(task.name),
                  subtitle: Text('Priority:', ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
