import 'package:flutter/material.dart';
import 'package:planin_me/widget/rotes.dart';

import 'package:planin_me/widget/task_list.dart';
import 'package:planin_me/widget/task_form.dart';
import 'package:planin_me/widget/task_details.dart';


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return MaterialApp(

      title: "Planin'ME",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: {
        Rotes.home : (context) => TaskList(),
        Rotes.taskForm : (context) => TaskForm(),
        Rotes.taskDetails : (context) => TaskDetails()
      },
    );
  }
}