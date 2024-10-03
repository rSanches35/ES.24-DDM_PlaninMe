import 'package:flutter/material.dart';
import 'package:planin_me/widget/rotes.dart';

class TaskDetails extends StatelessWidget {

  const TaskDetails({Key? key}) : super(key: key);

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