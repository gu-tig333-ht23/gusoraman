import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart'; 
import 'providers.dart';


// själva programmetskärna
void main() {
  TodoProvider state = TodoProvider();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
  ),
);
  state.fetchTodos();
}


// Kommern nog göra om detta och göra themes en egen fil för bättre strukturerard kod
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.black,
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.white,             
      ),
      home: Theme(
        data: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.black,
             
          ),
        ),
        child: TodoList(),
      ),
    );
  }
}
