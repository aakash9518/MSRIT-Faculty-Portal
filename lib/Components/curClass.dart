import 'package:flutter/material.dart';

class CurClass extends StatefulWidget{

  CurClassState createState()=> CurClassState();
}

class CurClassState extends State<CurClass>{
  String status="Ongoing";
  String room = "AB517";
  String subject = "Fundamentals of computing ";
  String classCode = "CS2B";
  String timings = "11:05 am  to 12 pm";
  @override
  Widget build(BuildContext context) {
    
    return Card(
      key:Key("1"),
      elevation: 5,
      child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  child: Text('Status : '+status),
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),),
                Padding(
                  child: Text('Room No: '+room),
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child:Padding(
                    child: Text('Subject : '+subject),
                    padding: EdgeInsets.fromLTRB(5, 10, 10, 10),),),
                Padding(
                    child: Text('Class : '+classCode),
                    padding: EdgeInsets.fromLTRB(5, 10, 10, 10),)
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  child: Text('Timings : '+timings),
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),),
                // Padding(
                //   child: Text('Status'),
                //   padding: EdgeInsets.fromLTRB(5, 10, 10, 10),),
                ],
              ),
            ]
          )
      );
  }
  
}