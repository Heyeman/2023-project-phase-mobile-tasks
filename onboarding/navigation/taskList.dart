import 'package:flutter/material.dart';
import 'package:replicate/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = [
      Todo("UI/UX design", "Design the whole interface of a website", "April 20, 20203"),
      Todo("Setup server", "Setup server for backend function.", "Aug 3"),
      Todo("Create database", "Create MySQL db", "Aug 28, 2023"),

    ];
    return Scaffold(
      appBar: null,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                Icon(Icons.arrow_back,
                size: 40,),
                Text("To Do list",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),),
                Icon(Icons.more_vert, size: 40,)
            ])),
               Container(child:  Image.asset("images/photo1.png", scale: 1.5,)),
              Text("Tasks list",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              GestureDetector(

                onTap: (){
                  Navigator.pushNamed(
                    context,
                      '/task-detail',
                    arguments: todos[0]
                  );
                },
                child: taskDesc(todos[0].title, todos[0].description, todos[0].deadline),
              ),
              GestureDetector(

                onTap: (){
                  Navigator.pushNamed(
                      context,
                      '/task-detail',
                      arguments: todos[1]
                  );
                },
                child: taskDesc(todos[1].title, todos[1].description, todos[1].deadline),
              ),
              GestureDetector(

                onTap: (){
                  Navigator.pushNamed(
                      context,
                      '/task-detail',
                      arguments: todos[2]
                  );
                },
                child: taskDesc(todos[2].title, todos[2].description, todos[2].deadline),
              ),

              GestureDetector(
                  onTap: ()=> {

                    // Navigator.pushNamed(context, '/task-detail')
                  },

                  child:Container(
            height: 60,

            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent,
            ),
            child: const Center(
              child: Text('Create task'
                , style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
            )))

            ]));
  }



  Widget taskDesc(String title, String description, String deadline){
    return

      Container(
      margin: EdgeInsets.all(8),
    padding: EdgeInsets.fromLTRB(10, 5,15,  15),
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
    )
        ,child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Text(title[0],
  style: TextStyle(
      fontWeight: FontWeight.bold,
    fontSize: 30
  ),),
        Text(title,
        style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20
        ),),
        Text(deadline)
      ],
    ));
  }
}
