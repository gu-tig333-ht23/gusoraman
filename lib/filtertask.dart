import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_list.dart'; 
import 'providers.dart';

class FilterTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Tasks'),
      ),
      body: Center(
        child: Text('This is the Filtered Tasks Page'),
      ),
    );
  }
}