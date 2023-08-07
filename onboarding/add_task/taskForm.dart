import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget{
  const TaskForm({super.key});

  @override
  Widget build(BuildContext build){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back, size: 40,),
            Icon(Icons.more_vert, size: 40,)
          ],
        ),
        Text("Create new tasks",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),)
        ,
        generateFields("Title", "UI/UX App design"),
        generateFields("Due date", "April 29, 2023"),
        generateFields("Description", "desc"),
        Container(
          height: 50,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(horizontal: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.redAccent,
          ),
          child: const Center(
            child: Text('Add task'
              , style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
          ),)


      ],
    );
  }


  Widget generateFields(String title, String desc){
    return

      Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),


          child:Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,

                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent
                ),),

              Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(7.0),

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
                  child:         TextField(
                    decoration: InputDecoration(
                      hintText: desc,

                    ),

                  )

              ),
            ],
          ));


  }
}
