import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

/* 
  #25- Using a Stream Builder
    - 설정 form이 Listen data & access data 할 수 있게 연결 작업
    - 출입구 뚫어놓기! firestore에 있는 실데이터를 form에 연결
*/
class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  //form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) { //if we have data
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Update your brew settings.",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? "Please enter a name" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugars"),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val),
                    value: _currentSugars ?? userData.sugars,
                    decoration: textInputDecoration,
                  ),
                  Slider(
                    onChanged: (double value) {
                      setState(() {
                        _currentStrength = value.round();
                      });
                    },
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    min: 100,
                    max: 900,
                    divisions: 8,
                    activeColor: Colors.brown[_currentStrength ?? userData.strength],
                    inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(_currentName);
                      print(_currentStrength);
                      print(_currentSugars);
                    },
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
