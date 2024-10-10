import 'package:flutter/material.dart';
import 'package:planin_me/app/widget/routes.dart';

class TaskForm extends StatelessWidget {

  const TaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Home')
          )
        ],
      ),
    );
  }  
}