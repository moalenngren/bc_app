import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GalleryPageState createState() => new _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Gallery"),
        backgroundColor: appBarColor,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Welcome to gallery',
              style: new TextStyle(color: darkWhite, fontSize: 20.0),
            ),
  
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}