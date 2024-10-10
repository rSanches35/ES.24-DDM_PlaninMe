import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routes.dart';

import 'package:planin_me/app/widget/task_list.dart';
import 'package:planin_me/app/widget/task_form.dart';
import 'package:planin_me/app/widget/task_details.dart';


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return MaterialApp(

      title: "Planin'ME",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: {
        Routes.home : (context) => TaskList(),
        Routes.taskForm : (context) => TaskForm(),
        Routes.taskDetails : (context) => TaskDetails()
      },
    );
  }
}