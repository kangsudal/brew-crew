import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
/*
sign in 레이아웃 위젯.
*/

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text field state
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Email 입력란이 비어있습니다!" : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                validator: (val) =>
                    val.length < 6 ? "Enter a password 6+ chars long" : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Sign in"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    //access service function
                    dynamic result = await _auth.signInWithEmailAndPassword(email,password);

                    if (result == null) {
                      setState(() {
                        error = "could not sign in with those credentials.";
                      });
                    } else {
                      print("signed in");
                      print(result.uid);
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
