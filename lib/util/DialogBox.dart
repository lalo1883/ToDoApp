import 'package:flutter/material.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[300],
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border:OutlineInputBorder(),
                hintText: "Type a task"
              ),
            ),
            SizedBox( height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                    child: TextButton(
                      onPressed: (){
                        controller.clear();

                      },
                      child: Text("Save", style: TextStyle(color: Colors.black),),)),
                SizedBox(width: 8),
                Container(
                  color: Colors.white,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Cancel", style: TextStyle(color: Colors.black),),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
