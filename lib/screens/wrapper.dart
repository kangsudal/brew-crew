import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* 
인증 상태에 따라 알맞은 screen widget을 반환해줌
*/
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authenticate widget
    if (user == null) {//로그인이 안돼있을때
      return Authenticate();
    } else {//로그인이되어있을때
      return Home();
    }
  }
}
