import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

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
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? "Please enter a name" : null,
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
            value: _currentSugars ?? "0",
            decoration: textInputDecoration,
          ),
          Slider(
            onChanged: (double value) {
              setState(() {
                _currentStrength = value.round();
              });
            },
            value: (_currentStrength ?? 100).toDouble(),
            min: 100,
            max: 900,
            divisions: 8,
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
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
  }
}
