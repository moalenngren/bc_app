import 'package:flutter/material.dart';
import 'package:bc_app/pages/game_page.dart';

Container buildGameLayout(Game game) {
  print("Building " + game.title);
  return 
  Container(
    height: 140.0,
    margin: EdgeInsets.only(bottom: 20.0),
    child:
    GestureDetector(
    onTap: (){
      //Navigator push to game!!!
      print("Open the game here!");
      print("Tapped " + game.title);
    },
    child: Image.asset(game.imageString)
    )
  );
}