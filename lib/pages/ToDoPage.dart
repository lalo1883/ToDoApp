import 'package:flutter/material.dart';
import 'package:todoappv3/util/todo_tile.dart';
import 'package:todoappv3/util/DialogBox.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<home_page> {
  final _controller = TextEditingController();

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

  void addTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
  }

  void returnToMain(){
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(context: context, builder: (context){
      return Dialogbox(
        controller: _controller,
        onSave: addTask,
        onCancel: returnToMain
      );
    },);
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
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[300],
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
