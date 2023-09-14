import 'package:flutter/material.dart';
import 'add_activity.dart'; // Import the AddActivity class
import 'package:provider/provider.dart';


class TodoItem {
  final String name;
  bool isChecked;

  TodoItem({required this.name, this.isChecked = false});

}

class TodoProvider extends ChangeNotifier {
  List<TodoItem> _tasks = [TodoItem(name: "Hello world")];
  List<TodoItem> get tasks => _tasks;
  void addTask(TodoItem task) {
    _tasks.add(task);
    notifyListeners();

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
          return _todo(tasks[index].name);
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

// Själva _todo widget som visar allt i själva att göra UIn

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