import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class DiscographyPage extends StatefulWidget {
  DiscographyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DiscographyPageState createState() => new _DiscographyPageState();
}

class _DiscographyPageState extends State<DiscographyPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("ALL BC RELEASES"));
    widgetList.add(subHeaderText("BLa blab lab labl a... "));

     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Discography"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}