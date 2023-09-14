import 'package:flutter/material.dart';
import 'add_activity.dart'; // Import the AddActivity class

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Color.fromARGB(255, 196, 188, 188)),
        body: Column(children:[
          _task("Write a Book"),
          _task("Eat food")
        ]),
        floatingActionButton: 
          FloatingActionButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddActivity()),
            );
          }, child: Icon(Icons.add)),
    );
  }
}

Widget _task(String name, {bool isChecked = false}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildCheckbox(isChecked),
        _buildTaskName(name),
        _buildCloseIcon(),
      ],
    ),
  );
}

Widget _buildCheckbox(bool isChecked) {
  return Padding(
    padding: EdgeInsets.only(right: 5),
    child: Checkbox(
      value: isChecked,
      onChanged: null,
    ),
  );
}

Widget _buildTaskName(String name) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}

Widget _buildCloseIcon() {
  return Padding(
    padding: EdgeInsets.only(right: 10, bottom: 5),
    child: Icon(Icons.close),
  );
}