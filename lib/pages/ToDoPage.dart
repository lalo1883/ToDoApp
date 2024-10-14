import 'package:flutter/material.dart';
import 'package:todoappv3/util/todo_tile.dart';


class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<home_page> {

  List toDoList = [
    ["Do course", false],
    ["aa", false],
    ["Gsvym", false],
    ["Perro", false],
    ["Gato", false],
    ["aasdsa", false],
  ];

  void checkBoxChanged(int index, bool? value) {
    print("Changed: $index, $value");
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text("To Do", style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            TaskName: toDoList[index][0],
            check: toDoList[index][1],
            onChange: (value) => checkBoxChanged(index, value),
          );
        }
      ),
    );
  }
}
