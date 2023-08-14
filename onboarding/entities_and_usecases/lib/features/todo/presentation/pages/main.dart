import 'package:flutter/material.dart';
import 'taskList.dart' as TL;
import 'taskDetail.dart' as TD;
import 'createTask.dart' as CT;

class Todo {
  final String title;
  final String description;
  final String deadline;


  const Todo(this.title, this.description, this.deadline);
}

void main() {
  List<Todo> todos = [
    Todo("UI/UX design", "Design the whole interface of a website",
        "April 20, 20203"),
    Todo("Setup server", "Setup server for backend function.", "Aug 3"),
    Todo("Create database", "Create MySQL db", "Aug 28, 2023"),
  ];

  runApp(generateApp(todos));
}

MaterialApp generateApp(List<Todo> todos) => MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TL.MyApp(todos: todos),
        '/task-detail': (context) => TD.MyApp(),
        '/create-task': (context) => CT.MyApp()
      },
    );
