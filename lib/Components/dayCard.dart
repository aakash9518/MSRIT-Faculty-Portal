import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expandable/expandable.dart';

class DayCard extends StatelessWidget{
    final FirebaseAuth auth = FirebaseAuth.instance;
    
    String day = "";
    DayCard(this.day);
    Future<FirebaseUser> getUser() async {
    return auth.currentUser();
  }

  getHashCode() async{
    int a = getUser().hashCode;

    print(a);
  }
  setTimings(){

  }
  
  @override
  Widget build(BuildContext context) {
   return Row(
      children: <Widget>[
        Expanded(
          child:GestureDetector(
            onTap:  getHashCode,
            child:Card( 
              elevation: 5,
              child:ExpandablePanel(
                header: Center(
                  child: Padding(padding: EdgeInsets.all(10),child: Text(this.day,style: TextStyle(fontWeight: FontWeight.bold),),),) ,

                expanded: Container(
                  height: 300,
                  child:DataTable(
                    columns: [
                      DataColumn(label: Text("Time")),
                      DataColumn(label: Text("Class")),
                      DataColumn(label: Text("Subject")),
                      ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("Hellod"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Helldo"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Helldo"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        ]),
                      DataRow(cells: [
                        DataCell(Text("Helldo"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Hedllo"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Heldlo"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        ]),
                      DataRow(cells: [
                        DataCell(Text("Hell2o"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Hell3o"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Hell4o"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        ]),
                      DataRow(cells: [
                        DataCell(Text("Hello"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Hello"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        DataCell(Text("Hello"),showEditIcon: true,placeholder: true,onTap: setTimings),
                        ]),
                      ],
                  ) ,),
        )))),
      ],);
  }

}