import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/build_topic_layout.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/pages/settings_page.dart';
import 'package:bc_app/classes.dart';
import 'package:bc_app/pages/info_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.user}) : super(key: key);
  final String title;
  final User user;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Topic> allTopics = [
    new Topic(
      "Biography",
      "Browsing Collection was founded 2008",
      "assets/images/biography_icon.png",
      (){ 
        print("Clicked biography");
      }),
    new Topic(
      "Discography",
      "Click here to see all releases",
      "assets/images/discography_icon.png",
      (){ 
        print("Clicked discography");
      }),
    new Topic(
      "Members",
      "Click here to read about all members",
      "assets/images/members_icon.png",
      (){ 
        print("Clicked members");
      }),
    new Topic(
      "Endorsement",
      "Click here to read about endorsers",
      "assets/images/endorsement_icon.png",
      (){ 
        print("Clicked endorsement");
      }),
    new Topic(
      "Contact",
      "Send a message",
      "assets/images/chat_icon.png",
      (){ 
        print("Clicked chat");
      }),
    ];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    //PROFILE PIC TODO - Get from real user
    widgetList.add(Container(
        margin: EdgeInsets.all(20.0),
        child: Image.asset("assets/images/profile_placeholder.png"), height: 200.0,));

    //USER NAME
    widgetList.add(Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Text(
          widget.user.userName,
          style:
              TextStyle(fontFamily: "Rockout", color: yellow, fontSize: 27.0),
          textAlign: TextAlign.center,
        )));

    //MY ACCOUNT BUTTON
    widgetList.add(
      smallButton("Go Backstage", darkGrey, yellow, (){
        print("Clicked my profile button");
      })
    );

    //SCROLL LIST WITH TOPICS
    for (Topic topic in allTopics) {
      widgetList.add(buildTopicLayout(topic));
    }

    return new Scaffold(
      appBar: new AppBar(
          title: apptitle("Browsing Collection"),
          backgroundColor: appBarColor,
          actions: <Widget> [appBarIconsInfo(context), appBarIconsSettings(context), appBarIconsProfile(context)]),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}
