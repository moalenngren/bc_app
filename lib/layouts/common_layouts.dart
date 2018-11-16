import 'package:bc_app/styles.dart';
import 'package:flutter/material.dart';

//HEADER
Container headerText(String text) {
  return Container(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 25.0), 
        child:
         Text(text, 
         style: TextStyle(fontFamily: "Rockout", 
         color: yellow, 
         fontSize: 35.0),),),
         Container(
           margin: EdgeInsets.symmetric(vertical: 10.0),
           color: yellow,
           height: 1.0,
         )
         ]
    )
  );
}

//SUBHEADER
Container subHeaderText(String text) {
  return Container(
      child:
         Text(text, style: TextStyle(color: lightGrey, fontSize: 27.0, fontFamily: "Quarca"), textAlign: TextAlign.center,),
  );
}

//SMALL LINE
Container smallLine({Color color = Colors.white, double height = 1.0, double margin = 10.0}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: margin),
    color: color,
    height: height,
  );
}