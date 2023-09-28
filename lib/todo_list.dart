import 'package:flutter/material.dart';
import 'add_activity.dart'; 
import 'package:provider/provider.dart';
import 'filtertask.dart';
import 'providers.dart';




//Själva huvudsidan som visar alla todo objekt
class TodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    var filteredTasks = Provider.of<TodoProvider>(context).getFilteredTasks();
    context.read<TodoProvider>().fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Theme.of(context).colorScheme.onPrimary),
        //visar själva uppgiftslistan
        body: ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: (context, index) {
          return _todo(
            context: context,
            task: filteredTasks[index],
            index: index,
            onRemove: () {
              Provider.of<TodoProvider>(context, listen: false).removeTask(filteredTasks[index]);
            },
          );
        },
        ),
        floatingActionButton: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //knappen som leder till att lägga till en aktivitet 
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
          //Knappen som leder till filtersidan
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
  Color textColor = task.done ? Colors.black : Colors.black;
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
          //själva uin för checkboxen
          child: Checkbox(
            activeColor: Colors.white,
            checkColor: Colors.black,
            value: task.done,
            onChanged: (newValue) {
              Provider.of<TodoProvider>(context, listen: false).toggleTask(task);;
            },
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 20, 
                  color: textColor, 
                  decoration: task.done ? TextDecoration.lineThrough : TextDecoration.none,),
                
              ),
            ],
          ),
        ),
        //själva uin och knappen för att ta bort en uppgift
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