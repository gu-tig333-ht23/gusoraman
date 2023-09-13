import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Color.fromARGB(255, 196, 188, 188)),
        body: Column(children:[
          _task("Write a Book"),
          _task("Eat food")
        ]),
        floatingActionButton: 
          FloatingActionButton(onPressed: () {Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddActivity()
            ));}, child: Icon(Icons.add)));
  }
}

Widget _task(String name, {bool isChecked = false}) {
  return Container(decoration:BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(right:5),
        child: Checkbox(
          value: isChecked,
          onChanged: null, // Set onChanged to null to make it static and non-interactable
        ),
      ),

      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
            style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
        Padding(
          padding: EdgeInsets.only(right: 10, bottom:5),
          child: Icon(Icons.close),
          ),  
    ],
  )
  );
}

class AddActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 196, 188, 188),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align the column contents to the top
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0), // Adjust the padding as needed
              child: Container(
                width: 400.0, // Adjust the width as needed
                height: 200.0, // Adjust the height as needed
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // Add a border
                    hintText: 'What are you going to do',
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(top:100),
          child: Text("+ Add"),
          )// Add other widgets or elements below the TextField as needed
          ],
        ),
      ),
    );
  }
}