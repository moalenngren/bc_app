import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';

class User {
  String userName;
  int xp;
  int points;
  /*int concertsSeen;
  int gamesPlayed;
  bool didReadABoutAllMembers;
  bool didShareGameResult;*/

  User(this.userName, this.xp, this.points);
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {



    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Browsing Collection"),
        backgroundColor: appBarColor,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Welcome to home',
              style: new TextStyle(color: darkWhite, fontSize: 20.0),
            ),
  
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}