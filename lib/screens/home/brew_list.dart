import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    final brews = Provider.of<QuerySnapshot>(context);
    for (var doc in brews.documents) {
      print(doc.data);
    }
    return Container();
  }
}
