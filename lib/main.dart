import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart';
import 'apiproviders.dart';
import 'theme.dart';

//Om inte nyckeln fungerar gå du till filen getapikeyhereifneeded.dart för hämta en ny och sedan byter bara ut variabeln
//apiKey på apiproviders.dart med den nya nyckel printas i debug consolen

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


// Själva klassen för programmet
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      theme: UiTheme.myTheme(),
      home: TodoList(),
      );
    }
  }
