import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'package:firebase_database/firebase_database.dart';


class Login extends StatefulWidget{

LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn =  new GoogleSignIn(scopes: ['email']);
  
  @override
  void initState() { 
    super.initState();
    getUser().then((user) {

      if(user!=null){
        print('already logged in as '+user.displayName);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home() ));
      }
    });
  }
  Future<FirebaseUser> getUser() async {
    return auth.currentUser();
  }
  Future<void> signIn() async{
    try{
      final GoogleSignInAccount googleSignInAccount=   await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult = await auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      
      print('signed in as '+user.displayName);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home() ));


      var ref  = FirebaseDatabase.instance.reference().child('users').push();
      ref.set({
        "id":ref.key,
        "name":user.displayName,
        "email":user.email,
      });

      }
    catch(err){
      print(err);
    }
  }

  Future<void> signOut() async{
    await googleSignIn.signOut();
    await auth.signOut();
    print('signed out');
  
  }
@override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Center(
          child: Padding(
          padding: EdgeInsets.all(20),
          child : Column(
            children: <Widget>[
                RaisedButton(
                  onPressed:signIn , 
                  child: Text('Sign in with Google'),),

                SizedBox(height: 20,),
                
                RaisedButton(
                  onPressed: signOut,
                  child: Text('Sign out'),)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            
          )
        )
      )
      );
  }
}

