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
          _todo("Write a Book"),
          _todo("Eat food")
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

Widget _todo(String name, {bool isChecked = false}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Checkbox(
            value: isChecked,
            onChanged: null,
          ),
        ),
        Expanded(
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
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, bottom: 5),
          child: Icon(Icons.close),
        ),
      ],
    ),
  );
}