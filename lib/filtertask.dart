import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

//Själva sidan för filter

class FilterTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text('ToDo List'),
      centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Filter för klara tasks
                Provider.of<TodoProvider>(context, listen: false).setFilter(FilterType.Checked);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
              foregroundColor:Theme.of(context).appBarTheme.foregroundColor,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,),
              child: Text('Show done tasks'),           
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Filter för oklara tasks
                Provider.of<TodoProvider>(context, listen: false).setFilter(FilterType.Unchecked);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
              foregroundColor:Theme.of(context).appBarTheme.foregroundColor,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,),
              child: Text('Show unfinished tasks'),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Tar bort filter
                Provider.of<TodoProvider>(context, listen: false).setFilter(FilterType.All);
                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
              foregroundColor:Theme.of(context).appBarTheme.foregroundColor,
              backgroundColor:Theme.of(context).appBarTheme.backgroundColor),
              child: Text('Show all tasks'),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
