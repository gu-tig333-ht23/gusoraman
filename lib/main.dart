import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart'; 
import 'add_activity.dart'; 


// själva programmetskärna
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
