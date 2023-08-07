import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "my app",
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child:  Container(
              // margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),

  child: imageView(),
  //            child: TaskForm()


          )
    ))
    )
    );
  }
}

class imageView extends StatelessWidget{
  const imageView({super.key});

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [


        Image.asset("images/photo.jpg",
          fit: BoxFit.fill,
          height: double.infinity,),
        Container(
          height: 50,

          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          margin: const EdgeInsets.fromLTRB(70, 700, 70, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.redAccent,
          ),
          child: const Center(
            child: Text('Get started'
              , style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
          ),)

      ],
    );
    // return ;
  }
}
