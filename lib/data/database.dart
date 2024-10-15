import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box("box");

  // Método para crear los datos iniciales si no existen
  void createInitialData() {
    toDoList = [
      ["Example 1", false],
      ["Example 2", false],
    ];
  }

  // Cargar los datos desde Hive
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // Actualizar los datos en Hive
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
