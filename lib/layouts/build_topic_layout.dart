import 'package:flutter/material.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/classes.dart';

GestureDetector buildTopicLayout(Topic topic) {
 return GestureDetector(
   onTap: topic.onCLick,
   child:
 Container(
   color: darkGrey,
   child: Column(
     children: <Widget>[
       //SMALL LINE
       //smallLine(color: yellow, height: 0.5),
       Container(height: 0.5, color: yellow),
       IntrinsicHeight(
         child:
       Row(
         children: <Widget>[
        //IMAGE
        Container(
          margin: EdgeInsets.only(right: 20.0),
          child: 
         Image.asset(topic.imageString, height: 50.0,)),
         //TITLE & DESC
         Expanded(
           child:
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Container(
               margin: EdgeInsets.only(top: 10.0),
               child:
            Text(topic.title, style: TextStyle(fontFamily: "Quarca", fontSize: 27.0, color: yellow), textAlign: TextAlign.left,)),
            Container(
               margin: EdgeInsets.only(bottom: 10.0),
               child:
            Text(topic.description, style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, color: lightGrey), textAlign: TextAlign.left,))
          ],
        )
         )
         ]
       )
       )
     ],
       
   ),
 ));
}