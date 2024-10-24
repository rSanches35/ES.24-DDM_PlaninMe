import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routine_list.dart';
import 'package:planin_me/app/widget/task_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.cyan[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Button: "Routines"
            ElevatedButton(
              onPressed: () {
                // Action when "Routines" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan, // Background color
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text(
                'Tasks',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons

            // Second Button: "Tasks"
            ElevatedButton(
              onPressed: () {
                // Action when "Tasks" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoutineList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text(
                'Routines',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
