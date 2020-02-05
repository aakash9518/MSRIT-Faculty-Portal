import 'package:flutter/material.dart';
import './home.dart';
import './timeTable.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title:'hello world',
      
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title:Text("MSRIT Faculty Portal"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(child: Text("Home"),),
                Tab(child: Text("TimeTable"),)
                ],
              ),  
            ),
          body: TabBarView(
            children: <Widget>[
              Tab(child: Home(),),
              Tab(child: TimeTable(),)
            ],
          ),
        )
      )
    );
  }

}
