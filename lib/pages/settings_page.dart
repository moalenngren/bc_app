import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/classes.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title, /*this.user*/}) : super(key: key);
  final String title;
  //final User user;

  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("DEVICE"));
    widgetList.add(subHeaderText("Turn sound on/off, \nlanguage: SWE, JPN, ESP"));

    widgetList.add(headerText("MY ACCOUNT"));
    widgetList.add(subHeaderText("Change password, \nlog out, \nremove account"));


     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Settings"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}