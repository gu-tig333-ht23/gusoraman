import 'package:flutter/material.dart';

class AddActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What are you going to do',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("+ Add"),
            )
          ],
        ),
      ),
    );
  }
}
