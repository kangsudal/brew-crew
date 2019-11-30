import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
/*
Sign up 레이아웃 위젯.
*/

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  //text field state
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign up to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () async {
/*
                  //access service function
                  dynamic result = await _auth.signInAnon();

                  if (result == null) {
                    print("error signing in");
                  } else {
                    print("signed in");
                    print(result.uid);
                  }
                  */
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
