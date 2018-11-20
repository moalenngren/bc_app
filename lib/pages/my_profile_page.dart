import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class MyProfilePage extends StatefulWidget {
  MyProfilePage({Key key}) : super(key: key);

  @override
  _MyProfilePageState createState() => new _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    //PROFILE PIC TODO - Get from real user
    widgetList.add(Container(
      margin: EdgeInsets.all(20.0),
      child: Image.asset("assets/images/profile_placeholder.png"),
      height: 200.0,
    ));

    //POINTS LABEL
    widgetList.add(smallButton("530 XP", darkGrey, yellow, () {
      print("Clicked points");
    }));

//FAN STAGE LABEL
    widgetList.add(Container(
        child: Row(
      children: <Widget>[
        Expanded(
            child: Container(
          color: lightGrey,
          height: 1.0,
        )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Extreme Admirer", //TODO - send real user data with calculateFanStage(user)
            style: TextStyle(
                color: lightGrey, fontSize: 25.0, fontFamily: "Quarca"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: Container(
          color: lightGrey,
          height: 1.0,
        )),
      ],
    )));

    /*
    for (FanItem item in allFanItems) {
      widgetList.add(buildFanItemLayout(user));
    } */

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("My Backstage"),
        backgroundColor: appBarColor,
      ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}
