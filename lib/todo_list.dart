import 'package:flutter/material.dart';
import 'add_activity.dart'; // Import the AddActivity class
import 'package:provider/provider.dart';


//klass objekt för en todo objekt

class TodoItem {
  final String name;
  bool isChecked;

  TodoItem({required this.name, this.isChecked = false});

}

//Själva provider klassen, där man har alla funktioner som ändrar tillståndet

class TodoProvider extends ChangeNotifier {
  List<TodoItem> _tasks = [];
  List<TodoItem> get tasks => _tasks;

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
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TodoProvider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Color.fromARGB(255, 196, 188, 188)),
        body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return _todo(
            context: context,
            task: tasks[index],
            index: index,
            onRemove: () {
              Provider.of<TodoProvider>(context, listen: false).removeTask(index);
            },
          );
        },
        ),
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

// Själva _todo widget som visar allt i själva todo UIn

Widget _todo({required BuildContext context, required TodoItem task, required int index, VoidCallback? onRemove}) {
  Color textColor = task.isChecked ? Colors.grey : Colors.black;
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
            activeColor: Colors.black,
            value: task.isChecked,
            onChanged: (newValue) {
              Provider.of<TodoProvider>(context, listen: false).toggleTask(index);
            },
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.name,
                style: TextStyle(
                  fontSize: 20, 
                  color: textColor, 
                  decoration: task.isChecked ? TextDecoration.lineThrough : TextDecoration.none,),
                
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, bottom: 5),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black),
            onPressed: onRemove,
          ),
        ),
      ],
    ),
  );
}