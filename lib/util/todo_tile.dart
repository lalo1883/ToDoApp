import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final bool check;
  final String TaskName;
  final Function(bool?)? onChange;
  final Function(BuildContext)? deleteFunction;


  TodoTile({
    super.key,
    required this.TaskName,
    required this.check,
    required this.onChange,
    required this.deleteFunction
  });
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top:25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              )
            ]),
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
              color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(10.0),
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
