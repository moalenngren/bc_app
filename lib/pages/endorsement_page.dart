import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class EndorsementPage extends StatefulWidget {
  EndorsementPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EndorsementPageState createState() => new _EndorsementPageState();
}

class _EndorsementPageState extends State<EndorsementPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("ENDORSERS"));
    widgetList.add(subHeaderText("BLa blab lab labl a... "));

     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Endorsement"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}