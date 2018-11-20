import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/layouts/build_game_layout.dart';

class Game {
  String title;
  String imageString;
  List<Gem> gems;

  Game(
      this.title,
      this.imageString,
      this.gems
  );
}

class Gem {
  String name;
  String epitet;
  Color color;
  bool isFound;

  Gem(
    this.name,
    this.epitet,
    this.color,
    this.isFound
  );
}

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => new _GamePageState();
}



class _GamePageState extends State<GamePage> {

//https://www.wixonjewelers.com/education/gemstones/gemstone-guide/
List<Gem> allGems = [
  new Gem("Sapphire", "The pick of loyalty", Colors.indigo, false),
  new Gem("Ruby", "The pick of passion", Colors.red, false),
  new Gem("Zircon", "The pick of wisdom", Colors.lightBlue, false),
  new Gem("Amethyst", "The pick of ingenuity", Colors.purple, false),
  new Gem("Diamond", "The pick of desire", Colors.grey, false),
  new Gem("Peridot", "The pick of life", Colors.green, false),
  new Gem("Rubellite", "The pick of energy", Colors.pink, false),
  new Gem("Citrine", "The pick of success", Colors.yellow, false),
  new Gem("Onyx", "The pick of dark magic", Colors.black, false),
];

List<Game> allGames = [
  new Game("Hardrock Alchemist", "assets/images/alchemist_game.png", []),
  new Game("Quiz", "assets/images/quiz_game.png", []),
  new Game("Flappy Fan", "assets/images/flappy_game.png", []),
];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(headerText("GAMES"));
    widgetList.add(subHeaderText("Time to play! " +
    "In these games you can collect points, gain XP and find hidden gems. Good luck! "));

    for (Game game in allGames) {
      widgetList.add(buildGameLayout(game));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Games"),
        backgroundColor: appBarColor,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList
      ),
      backgroundColor: backgroundColor,
    );
  }
}