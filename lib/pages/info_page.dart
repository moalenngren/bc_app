import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key key}) : super(key: key);


  @override
  _InfoPageState createState() => new _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("THE APP"));
    widgetList.add(smallText("This is not just an ordinary app. Imagine the greatness of a media player, informatic website, fun game playground and a communicative tool all together. This is the future.", lightGrey));

    widgetList.add(headerText("HOW DOES IT WORK?"));
    widgetList.add(smallText("There are two ways to use this app. Either the easy peasy old generation way where you can check upcoming shows and read about the band. Or the modern, interactive and super cool way where you can collect hidden gems, gain XP and get points. This can be done from playing games, checking in to live concerts, explore the app etc. The points can be used to unlock awesome appearel to your avatar or get cheap merch in the shop for example. Go explore now!", lightGrey));

    widgetList.add(headerText("CREDITS"));
    widgetList.add(smallText("The idea was born 2018 when me, Moa, started studying Application Development in Gothenburg. I spent 5h each day traveling back and forth with train and suddenly the beginning of this app was a fact. Please enjoy.", lightGrey));

    widgetList.add(smallText("Copy Right © Moa Lenngren", yellow));

     return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Information"),
          backgroundColor: appBarColor,
          ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}