import 'package:flutter/material.dart';
import 'add_activity.dart'; 
import 'package:provider/provider.dart';
import 'filtertask.dart';
import 'providers.dart';




//Själva huvudsidan som visar alla todo objekt
class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TodoProvider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Theme.of(context).colorScheme.onPrimary),
        
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddActivity()),
            );
          }, child: Icon(
            Icons.add,
            color: Colors.black,
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilterTask()),
            );     
            }, child: Icon(Icons.menu, 
            color: Colors.black,)
          ),
        ],
      ),
    );
  }
}

// Själva _todo widget som representerar Todo som objekt
 

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