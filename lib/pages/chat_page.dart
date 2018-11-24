import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChatPageState createState() => new _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("SEND A MESSAGE"));
    widgetList.add(subHeaderText("BLa blab lab labl a... "));

     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Contact"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}