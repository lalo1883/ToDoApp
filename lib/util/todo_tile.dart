import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final bool check;
  final String TaskName;
  Function(bool?)? onChange;


  TodoTile({
    super.key,
    required this.TaskName,
    required this.check,
    required this.onChange
  });
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top:25),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Checkbox(value: check, onChanged: onChange, activeColor: Colors.blueGrey,),
              Text(TaskName, style: TextStyle(decoration: check? TextDecoration.lineThrough : TextDecoration.none)),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10.0),
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 2.0),
          ),
        ),
      ),
    );
  }
}
