import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_list.dart';
import 'package:template/providers.dart';

//Själva klassen för att lägga till aktiviteter samt UIn för sidan

class AddActivity extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
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
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)
                    ), 
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Customize the focus color here.
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    hintText: 'What are you going to do',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String taskName = _textEditingController.text.trim();
                todoProvider.addTask(TodoItem(name: taskName));
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoList()),
            );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text("+ Add"),
            )
          ],
        ),
      ),
    );
  }
}
