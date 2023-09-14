import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_list.dart';

class AddActivity extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 196, 188, 188),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 400.0,
                height: 200.0,
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What are you going to do',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String taskName = _textEditingController.text.trim();
                todoProvider.addTask(TodoItem(name: taskName));
              },
              child: Text("+ Add"),
            )
          ],
        ),
      ),
    );
  }
}
