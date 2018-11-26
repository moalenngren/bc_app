import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/build_topic_layout.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/classes.dart';
import 'package:bc_app/pages/biography_page.dart';
import 'package:bc_app/pages/members_page.dart';
import 'package:bc_app/pages/discography_page.dart';
import 'package:bc_app/pages/chat_page.dart';
import 'package:bc_app/pages/endorsement_page.dart';
import 'package:bc_app/pages/my_profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.user}) : super(key: key);
  final String title;
  final User user;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

/*
goToProfile() {
  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyProfilePage()),
        );
} */

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    //ALL TOPICS
     List<Topic> allTopics = [
    new Topic(
      "Biography",
      "Browsing Collection was founded 2008...",
      "assets/images/biography_icon.png",
      (){ 
        print("Clicked biography");
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BiographyPage()),
        );
      }),
    new Topic(
      "Discography",
      "Click here to see all releases",
      "assets/images/discography_icon.png",
      (){ 
        print("Clicked discography");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiscographyPage()),
        );
      }),
    new Topic(
      "Members",
      "Click here to read about all members",
      "assets/images/members_icon.png",
      (){ 
        print("Clicked members");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MembersPage()),
        );
      }),
    new Topic(
      "Endorsement",
      "Click here to read about endorsers",
      "assets/images/endorsement_icon.png",
      (){ 
        print("Clicked endorsement");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EndorsementPage()),
        );
      }),
    new Topic(
      "Contact",
      "Send a message",
      "assets/images/chat_icon.png",
      (){ 
        print("Clicked chat");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      }),
    ];

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
      Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child:
      smallButton("Go Backstage", darkGrey, yellow, (){
        print("Clicked my profile button");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyProfilePage()),
        ); 
      }))
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
