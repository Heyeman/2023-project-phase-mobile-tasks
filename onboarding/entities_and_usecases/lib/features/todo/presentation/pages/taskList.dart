import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/todo/presentation/pages/main.dart';

class MyApp extends StatefulWidget {
  MyApp({required this.todos, super.key});

  final List<Todo> todos;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      Text(
                        "To Do list",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_vert,
                        size: 40,
                      )
                    ])),
            Container(
                child: Image.asset(
              "images/photo1.png",
              scale: 1.5,
            )),
            Text(
              "Tasks list",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...[
              for (var i = 0; i < widget.todos.length; i++) _genList(context, i)
            ],
            createTask(context)
          ]),
        ));
  }

  GestureDetector createTask(context) {
    Todo newTodo;
    return GestureDetector(
        onTap: () async => responseReceiver(context),
        child: Container(
            height: 60,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent,
            ),
            child: const Center(
              child: Text(
                'Create task',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }

  void responseReceiver(context) async {
    final result = await Navigator.pushNamed(
      context,
      '/create-task',
      arguments: Todo("title", "description", "deadline"),
    );
    Todo? newTodo = result as Todo?;
    if (newTodo != null) {
      // widget.todos.add(newTodo);
      // print(newTodo.title);
      setState(() {
        widget.todos.add(newTodo);
      });
    }
  }

  GestureDetector _genList(context, index) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/task-detail',
              arguments: widget.todos[index]);
        },
        child: taskDesc(widget.todos[index].title,
            widget.todos[index].description, widget.todos[index].deadline));
  }

  Widget taskDesc(String title, String description, String deadline) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.fromLTRB(10, 5, 15, 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 0.1,
              offset: Offset(6, 3),
            ),
          ],
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title[0],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(deadline)
          ],
        ));
  }
}
