import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login.dart';
import './Components/curClass.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget{
    Home();
  HomeState createState()=> HomeState();
}

class HomeState extends State<Home>{
String title ="hi";
FirebaseUser user ;
  final GoogleSignIn googleSignIn =  new GoogleSignIn(scopes: ['email']);

@override
  void initState() {
    super.initState();

      isUserSignedIn().then((value) {
        if(value==false){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
        }
      });
  
      setUser();
  }

  Future setUser() async{
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      if(user!=null)
        setState(() {
          this.user = user;
          this.title = user.displayName.toString();
        });
        
  }

  Future<bool> isUserSignedIn() async {
    FirebaseUser user =  await FirebaseAuth.instance.currentUser();
    return (user==null) ? false:true; 
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login()));
  }

  void pressMe(){
    

  }

    @override
    Widget build(BuildContext context) {
      
      return Scaffold( 
        // appBar: AppBar(
        //   title:Text('Home'),
        //   actions: <Widget>[
        //     MaterialButton(
        //       onPressed: signOut,
        //       textColor: Colors.white,
        //       child: Text('Sign Out'),)
        //   ],),
        body : Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CurClass(),
              // Text('click me ' + (this.user?.displayName ?? "here")),
              RaisedButton(
                child: Text("Take Attendance"),
                onPressed: pressMe),
              RaisedButton(
                onPressed: signOut,
                child: Text('Sign  Out'),)],
          )
        )
      ) ;
    }
  }
