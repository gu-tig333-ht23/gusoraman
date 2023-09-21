import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se'; 
const String apiKey = 'ce618333-46e5-4823-882d-b4311a0ec7cd';



class TodoItem {
  String? id;
  final String title;
  bool done;

  TodoItem({this.id, required this.title, this.done = false});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'], 
      title: json['title'] ?? 'untitled', 
      done: json['done']);
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


//Själva provider klassen, där man har alla funktioner som ändrar tillståndet
//Kanske en bra ide att separera denna här filen till två? 

class TodoProvider extends ChangeNotifier {
  List<TodoItem> _tasks = [];
  List<TodoItem> get tasks => _tasks;

  void fetchTodos() async {
    try {
    var tasks = await getTodos();
    _tasks = tasks;
    notifyListeners();
  } catch (e) {
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


  void setFilter(FilterType filterType) {
    _filterType = filterType;
    notifyListeners();
  }

  void addTask(TodoItem task) async {
    
    await http.post(Uri.parse('$ENDPOINT/todos?key=$apiKey'),
    headers: {
      'Content-Type':'application/json'
    },
    body: jsonEncode(task.toJson()),
    );
  }


  void removeTask(TodoItem task) async {
  final String? id = task.id; // Declare id variable
  await http.delete(
        Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
  _tasks.removeWhere((tasks) => tasks.id == id);
   notifyListeners();
}



  void toggleTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].done = !_tasks[index].done;
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
