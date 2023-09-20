import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart'; 
import 'providers.dart';


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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.white,
          seedColor: Color.fromARGB(255, 255, 255, 255),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      home: TodoList(),
    );
  }
}
