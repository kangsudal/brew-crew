
import 'package:flutter/material.dart';
/* Form 에서 입력 decoration. 흰색. 선택하면 핑크색 테두리생김 */
const textInputDecoration = InputDecoration(
  // hintText: "Email",
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);
