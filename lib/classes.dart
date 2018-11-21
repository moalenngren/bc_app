import 'package:flutter/material.dart';

class User {
  String userName;
  int xp;
  int points;
  /*int concertsSeen;
  int gamesPlayed;
  bool didReadABoutAllMembers;
  bool didShareGameResult;*/
  List gemsFound;

  User(this.userName, this.xp, this.points, this.gemsFound);
}

class Topic {
  String title;
  String description;
  String imageString;
  Function onCLick;

  Topic(this.title, this.description, this.imageString, this.onCLick);
}

class FanItem {
  String title;
  String imageString;
  int nr;

  FanItem(this.title, this.imageString, this.nr);
}