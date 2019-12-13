import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
/* Home 하위 리스트 위젯.
  database.dart의 brews 데이터를 표현할 레이아웃.
*/
class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? []; //List가 아직 loaded 안됐을때

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index){
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
