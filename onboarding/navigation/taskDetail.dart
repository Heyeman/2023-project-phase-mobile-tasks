import 'package:flutter/material.dart';
import "main.dart";


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
        appBar: null,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        GestureDetector(onTap: (){
                          Navigator.pop(context);
                        }, child: Icon(Icons.arrow_back,
                          size: 40,))



                        ,
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


                taskDesc("UI/UX App design", args.title),
                taskDesc("Description", args.description),
                taskDesc("Deadline",args.deadline),

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
