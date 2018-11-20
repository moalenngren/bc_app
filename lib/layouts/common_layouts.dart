import 'package:bc_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:bc_app/pages/settings_page.dart';
import 'package:bc_app/pages/info_page.dart';
import 'package:bc_app/pages/my_profile_page.dart';
import 'package:bc_app/classes.dart';

//HEADER
Container headerText(String text) {
  return Container(
      child: Column(children: [
    Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Text(
        text,
        style: TextStyle(fontFamily: "Rockout", color: yellow, fontSize: 35.0),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: yellow,
      height: 1.0,
    )
  ]));
}

//SUBHEADER
Container subHeaderText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: Text(
      text,
      style: TextStyle(color: lightGrey, fontSize: 27.0, fontFamily: "Quarca"),
      textAlign: TextAlign.center,
    ),
  );
}

//SMALL TEXT
Container smallText(String text, Color color) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 22.0, fontFamily: "Quarca"),
      textAlign: TextAlign.center,
    ),
  );
}

//SMALL LINE
Container smallLine(
    {Color color = Colors.white, double height = 1.0, double margin = 10.0}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: margin),
    color: color,
    height: height,
  );
}

//SMALL BUTTON
GestureDetector smallButton(
    String text, Color textColor, Color backgroundColor, Function func) {
  return GestureDetector(
      onTap: func(),
      child: Align(
        alignment: Alignment.center,
        child: Container(
            height: 40.0,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: new BoxDecoration(
                color: backgroundColor,
                borderRadius: new BorderRadius.all(Radius.circular(30.0))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 25.0,
                          fontFamily: "Quarca"),
                      textAlign: TextAlign.center,
                    )),
               /* Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.portrait)) */
              ],
            )),
      ));
}

//APP BAR ICONS
List<Widget> appBarIcons(BuildContext context) {
  return [
    //INFORMATION
    IconButton(
      icon: Icon(Icons.info_outline),
      onPressed: () {
        print("You clicked information");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
      },
      color: darkGrey,
    ),
    //SETTINGS
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        print("You clicked settings");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SettingsPage(
                  //user: widget.user,
                  )),
        );
      },
      color: darkGrey,
    ),
    //MY ACCOUNT
    IconButton(
      icon: Icon(Icons.portrait),
      onPressed: () {
        print("You clicked my profile");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyProfilePage(
                  //user: widget.user,
                  )),
        );
      },
      color: darkGrey,
    ),
  ];
}

String calculateFanStage(User user) {
  if (user == null || user.xp == null || user.xp < 50) return "Casual Follower";
  if (user.xp >= 50 && user.xp < 100) return "True Supporter";
  if (user.xp >= 100 && user.xp < 150) return "Huge Fan";
  if (user.xp >= 150 && user.xp < 250) return "Extreme Admirer";
  if (user.xp >= 250 && user.xp < 400) return "Fanatic Worshiper";
  if (user.xp >= 400 && user.xp < 150) return "Crazy Stalker";
  return "Casual Follower";
}
