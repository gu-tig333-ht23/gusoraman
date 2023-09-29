import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//Om nyckeln inte fungerar kan gå till apiftechkey.dart filen för att generara en ny nyckel
const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se'; 
const String apiKey = 'ce618333-46e5-4823-882d-b4311a0ec7cd';


//Själva klassen för todo
class TodoItem {
  String? id;
  final String title;
  bool done;

  TodoItem({this.id, required this.title, this.done = false});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'], 
      title: json['title'] ?? 'untitled', 
      done: json['done']?? false,);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "done": done,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
  }


//Själva provider och api klassen, där man har alla funktioner som ändrar tillståndet

class TodoProvider extends ChangeNotifier {
  List<TodoItem> _tasks = [];
  List<TodoItem> get tasks => _tasks;
  bool _todosFetched = false;

//Det är detta som gör att allt visas med andra det hämtar lagrad data från APIn
  void fetchTodos() async {
    try {
      if (!_todosFetched) {
    var tasks = await getTodos();
    _tasks = tasks;
    _todosFetched = true;
    notifyListeners();
  }} catch (e) {
    // Error testing 
      print('Error fetching todos: $e');
    }
  }
  
   Future<List<TodoItem>> getTodos() async {
    print('Testing API');
    http.Response response = await http.get(Uri.parse('$ENDPOINT/todos?key=$apiKey'));
    String body = response.body;
    print(body);
    List<dynamic> jsonResponse = jsonDecode(body);
    print("sucess");
    return jsonResponse.map((json) => TodoItem.fromJson(json)).toList();
  }

//Sätter uppgifter

  void setFilter(FilterType filterType) {
    _filterType = filterType;
    notifyListeners();
  }

//lägger till uppgifter
  void addTask(TodoItem task) async {
    
    await http.post(Uri.parse('$ENDPOINT/todos?key=$apiKey'),
    headers: {
      'Content-Type':'application/json'
    },
    body: jsonEncode(task.toJson()),
    );
    _todosFetched = false;
    notifyListeners();
  }

//tar bort uppgifter
  void removeTask(TodoItem task) async {
  final String? id = task.id; 
  await http.delete(
        Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
  _tasks.removeWhere((tasks) => tasks.id == id);
   notifyListeners();
}
//Själva toggle funktioner genom api
  void toggleTask(TodoItem task) async {
    final String? id = task.id;
    if (id != null) {
    final index = _tasks.indexWhere((tasks) => tasks.id == id);
    if (index != -1) {
      _tasks[index].done = !task.done;
    }
    await http.put(
        Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_tasks[index].toJson()),
      );
   notifyListeners();
  }
}

  
  FilterType _filterType = FilterType.All;
  FilterType get filtertype => _filterType;

  List<TodoItem> getFilteredTasks() {
    if (_filterType == FilterType.Checked) {
      return _tasks.where((task) => task.done).toList();
    } else if (_filterType == FilterType.Unchecked) {
      return _tasks.where((task) => !task.done).toList();
    } else {
      return _tasks;
    }
}
}

enum FilterType {All, Checked, Unchecked}
