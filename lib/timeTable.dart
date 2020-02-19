import 'package:flutter/material.dart';
import 'CreateTimeTable.dart';
class TimeTable extends StatefulWidget{

TimeTableState createState() => TimeTableState();  
}


class TimeTableState extends State<TimeTable>{

  goToCreateNewTimeTable(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTimeTable()));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: goToCreateNewTimeTable,
        ),
      body: Center(child: Text("hi this is time table"),),);

  }


}