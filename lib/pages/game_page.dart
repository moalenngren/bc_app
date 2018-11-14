import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => new _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("GAMES"));

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Games"),
        backgroundColor: appBarColor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
            children: widgetList),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
