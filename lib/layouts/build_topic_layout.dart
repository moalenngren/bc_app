import 'package:flutter/material.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/classes.dart';

Container buildTopicLayout(Topic topic) {
 return Container(
   child: Column(
     children: <Widget>[
       //SMALL LINE
       smallLine(color: yellow, height: 0.5),
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
            Text(topic.title, style: TextStyle(fontFamily: "Quarca", fontSize: 27.0, color: yellow), textAlign: TextAlign.left,),
            Text(topic.description, style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, color: lightGrey), textAlign: TextAlign.left,)
          ],
        )
         )
         ]
       )
       )
     ],
       
   ),
 );
}