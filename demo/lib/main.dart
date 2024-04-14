// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> todos = [];
  final TextEditingController _textEditingController = TextEditingController();
  final List<bool> isChecked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To-Do List',
          style: TextStyle(
            color: Colors.white,
            ),
          ),
        backgroundColor:  const Color.fromARGB(255, 0, 0, 0),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(
              todos[index],
              style: TextStyle(color: Colors.white),
            ),
            value: isChecked[index],
            onChanged: (bool? value) {
              setState(() {
                isChecked[index] = value!;
              });
            },
            activeColor: Colors.white,
            checkColor: Colors.black,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodoDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Enter your task'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  todos.add(_textEditingController.text);
                  isChecked.add(false);
                  _textEditingController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}