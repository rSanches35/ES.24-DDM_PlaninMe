import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routes.dart';
import 'package:planin_me/app/domain/dto/task_dto.dart';

import 'package:planin_me/app/widget/task_list.dart';
import 'package:planin_me/app/widget/task_form.dart';
import 'package:planin_me/app/widget/task_details.dart';
import 'package:planin_me/app/widget/task_update_form.dart';


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return MaterialApp(

      title: "Planin'ME",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      onGenerateRoute: (settings) {
        if (settings.name == Routes.taskForm) {
          final DTOTask? task = settings.arguments as DTOTask?;
          return MaterialPageRoute(
            builder: (context) => TaskForm(),
          );
        }
        else if (settings.name == Routes.taskUpdateForm) {
          final DTOTask? task = settings.arguments as DTOTask?;
          return MaterialPageRoute(
            builder: (context) => TaskUpdateForm(),
          );
        }
        return null;
      },
      routes: {
        Routes.home : (context) => TaskList(),
        Routes.taskForm : (context) => TaskForm(),
        Routes.taskUpdateForm : (context) => TaskUpdateForm(),
        Routes.taskDetails : (context) => TaskDetails()
      },
    );
  }
}