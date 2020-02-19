import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import './Components/dayCard.dart';

class CreateTimeTable extends StatefulWidget{

CttState createState() => CttState();

}
class CttState extends State<CreateTimeTable>{

  var ref = FirebaseDatabase().reference().child('faculty/2/timetable');

  void getdata ()async {
     await ref.once().then((DataSnapshot dataSnap) => print(dataSnap.value.toString()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Or Edit Your Timetable"),),
        body: StreamBuilder(
        
            stream: ref.onValue,
            builder: (context,snap){
              if(snap.hasData && !snap.hasError ){
                List data = snap.data.snapshot.value;
                print(data);
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){
                      
                      return DayCard(data[index]["Day"]);
                    });
              }
            },
          )
    
        );
     
      
  }

}