import 'package:flutter/material.dart';

//COLORS
Color yellow = Colors.amber;
Color backgroundColor = Colors.grey[900];
Color appBarColor = yellow;
Color bottomNavBarColor = yellow;
Color darkGrey = Colors.grey[900];
Color lightGrey = Colors.grey[600];
Color darkWhite = Colors.grey[50];
Color orange = Colors.orange[800];

//ICONS
Image gigsIcon = Image.asset("assets/images/Gigs_Icon.png", height: 45.0, color: darkGrey);
Image galleryIcon = Image.asset("assets/images/Gallery_Icon.png", height: 45.0, color: darkGrey);
Image homeIcon = Image.asset("assets/images/Profile_Icon.png", height: 45.0, color: darkGrey);
Image shopIcon = Image.asset("assets/images/Shop_Icon.png", height: 45.0, color: darkGrey);
Image gamesIcon = Image.asset("assets/images/Games_Icon.png", height: 45.0, color: darkGrey);

Text apptitle(String text) {
  return new Text(text, style: new TextStyle(color: darkGrey),);
} 



