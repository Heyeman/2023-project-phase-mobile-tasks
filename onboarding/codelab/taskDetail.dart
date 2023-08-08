import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,


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
              Container(
                  margin: EdgeInsets.all(20),

                  child:  Column(
                    mainAxisSize: MainAxisSize.max,

              children:[
                Image.asset("images/photo2.png",
                ),


                taskDesc("UI/UX App design", "April 19, 2023"),
                taskDesc("Description", "You are tasked with the provided picture"),
                taskDesc("Deadline", "April 19, 2023"),

              ]

              )),


            ]));
  }



  Widget taskDesc(String title, String description){
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 15
            ),),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            width: 400,

              padding: EdgeInsets.fromLTRB(15, 15, 10,15),
              decoration: BoxDecoration(
                color: Colors.grey,

                // color: Colors.blue,
                // borderRadius: BorderRadius.circular(10.0),
              )
              ,child:Text(description) )

        ],
      );




  }
}
