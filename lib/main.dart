import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart'; // Import the TodoList class
import 'add_activity.dart'; // Import the AddActivity class

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
  ),
);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}
