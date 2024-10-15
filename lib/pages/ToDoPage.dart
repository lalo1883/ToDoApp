import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoappv3/data/database.dart';
import 'package:todoappv3/util/todo_tile.dart';
import 'package:todoappv3/util/DialogBox.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<home_page> {
  ToDoDataBase db = new ToDoDataBase();
  final _myBox = Hive.box("box");

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(int index, bool? value) {
    print("Changed: $index, $value");
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void addTask(){
    print("addTask pushed");
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void returnToMain(){
    print("returnToMain pushed");
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

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
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
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[300],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            TaskName: db.toDoList[index][0],
            check: db.toDoList[index][1],
            onChange: (value) => checkBoxChanged(index, value),
              deleteFunction: (context) => deleteTask(index)
           );
        }
      ),
    );
  }
}
