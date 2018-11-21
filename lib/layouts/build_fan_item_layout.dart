import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/classes.dart';

Expanded buildFanItemLayout(/*User user,*/ FanItem item) {
  return Expanded(
    flex: 1,
    child:
    Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      children: <Widget>[
        Container(
          height: 60.0,
          margin: EdgeInsets.only(bottom: 5.0),
        child:
      Image.asset(item.imageString)),
      Text(item.title, style: TextStyle(fontFamily: "Quarca", color: lightGrey, fontSize: 22.0), textAlign: TextAlign.center,)
      ]
    ),
    )
  );
}