import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routine_list.dart';
import 'package:planin_me/app/widget/task_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
        ),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[300],
                foregroundColor: Colors.blueGrey[900],
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Tasks',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RoutineList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[300],
                foregroundColor: Colors.blueGrey[900],
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Routines',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
