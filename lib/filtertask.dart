import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

class FilterTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(appBarTheme: 
      AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,)),
      child: Scaffold(
      appBar: AppBar(
        title: Text('Filter Tasks'),
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
              backgroundColor: Colors.black,),
              child: Text('Show done tasks'),
            ),
            ElevatedButton(
              onPressed: () {
                // Filter för oklara tasks
                Provider.of<TodoProvider>(context, listen: false).setFilter(FilterType.Unchecked);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,),
              child: Text('Show unfinished tasks'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tar bort filter
                Provider.of<TodoProvider>(context, listen: false).setFilter(FilterType.All);
                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,),
              child: Text('Show all tasks'),
            ),
          ],
        ),
      ),
    ),
  );
}
}
