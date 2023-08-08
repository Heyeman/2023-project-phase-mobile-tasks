import 'package:flutter/material.dart';
import 'taskList.dart' as TL;
import 'taskDetail.dart' as TD;

class Todo {
  final String title;
  final String description;
  final String deadline;

  const Todo(this.title, this.description, this.deadline);
}
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>  TL.MyApp(),
        '/task-detail': (context) => const TD.MyApp()

      },
    )
  );
}
