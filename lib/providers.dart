import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//klass objekt för en todo objekt

class TodoItem {
  final String name;
  bool isChecked;

  TodoItem({required this.name, this.isChecked = false});

}

//Själva provider klassen, där man har alla funktioner som ändrar tillståndet
//Kanske en bra ide att separera denna här filen till två? 

class TodoProvider extends ChangeNotifier {
  List<TodoItem> _tasks = [];
  List<TodoItem> get tasks => _tasks;

  

  void setFilter(FilterType filterType) {
    _filterType = filterType;
    notifyListeners();
  }
  

  void addTask(TodoItem task) {
    _tasks.add(task);
    notifyListeners();
  }
  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  void toggleTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].isChecked = !_tasks[index].isChecked;
      notifyListeners();
    }
  }
  
  FilterType _filterType = FilterType.All;
  FilterType get filtertype => _filterType;

  List<TodoItem> getFilteredTasks() {
    if (_filterType == FilterType.Checked) {
      return _tasks.where((task) => task.isChecked).toList();
    } else if (_filterType == FilterType.Unchecked) {
      return _tasks.where((task) => !task.isChecked).toList();
    } else {
      return _tasks;
    }
}
}

enum FilterType {All, Checked, Unchecked}
