import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class BiographyPage extends StatefulWidget {
  BiographyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BiographyPageState createState() => new _BiographyPageState();
}

class _BiographyPageState extends State<BiographyPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("THE HISTORY OF BC"));
    widgetList.add(subHeaderText("BLa blab lab labl a... "));

     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Biography"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}