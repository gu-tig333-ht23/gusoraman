import 'package:flutter/material.dart';
import 'add_activity.dart'; 
import 'package:provider/provider.dart';
import 'filtertask.dart';
import 'apiproviders.dart';




//Själva huvudsidan som visar alla todo objekt
class TodoList extends StatelessWidget {
  const TodoList({super.key});


  @override
  Widget build(BuildContext context) {
    var filteredTasks = Provider.of<TodoProvider>(context).getFilteredTasks();
    context.read<TodoProvider>().fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
        //visar själva uppgiftslistan and returnerar ett todo objekt
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
          //knappen som leder till att en sida där man kan lägga till en aktivitet 
          FloatingActionButton(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            shape: CircleBorder(),
            onPressed: () {
            Navigator.push(
              
              context,
              MaterialPageRoute(builder: (context) => AddActivity()),
            );
          }, child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
            ),
          ),
          //Knappen som leder till filtersidan
          FloatingActionButton(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            shape: CircleBorder(),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilterTask()),
            );     
            }, child: Icon(Icons.menu, 
            color: Theme.of(context).colorScheme.primary,)
          ),
        ],
      ),
    );
  }
}

// Själva _todo widget som representerar Todo som objekt, samt checkboxen och krysset
 

Widget _todo({required BuildContext context, required TodoItem task, required int index, VoidCallback? onRemove}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 0.5)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          //själva funktionen för checkbox
          child: Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            checkColor: Theme.of(context).colorScheme.secondary,
            value: task.done,
            onChanged: (newValue) {
              Provider.of<TodoProvider>(context, listen: false).toggleTask(task);
            },
            visualDensity: VisualDensity.compact,
            side: BorderSide(color: Theme.of(context).colorScheme.secondary)
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
                  color: task.done
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.secondary,
                  decoration: task.done ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: task.done
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.secondary)
                  ,   
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
              color: Theme.of(context).colorScheme.secondary),
            onPressed: onRemove,
          ),
        ),
      ],
    ),
  );
}