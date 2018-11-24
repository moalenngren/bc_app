import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class MembersPage extends StatefulWidget {
  MembersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MembersPageState createState() => new _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("MEMBERS"));
    widgetList.add(subHeaderText("BLa blab lab labl a... "));

     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Members"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}