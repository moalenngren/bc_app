import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/pages/gallery_page.dart';
import 'package:bc_app/pages/gig_page.dart';
import 'package:bc_app/pages/shop_page.dart';
import 'package:bc_app/pages/game_page.dart';
import 'package:bc_app/pages/home_page.dart';
import 'package:bc_app/api.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StartPageState createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentBottomNavIndex = 0; //0



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /*appBar: new AppBar(
          title: apptitle("Browsing Collection"),
          backgroundColor: appBarColor,
        ), */
        body: _childrenOfBottomNav[2/*_currentBottomNavIndex*/],
        bottomNavigationBar: BottomNavigationBar(
          //fixedColor: bottomNavBarColor,
          
          onTap: onTabTapped,
          currentIndex: _currentBottomNavIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.music_note),
              title: new Text('Gigs'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.camera),
              title: new Text('Gallery'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), 
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop), 
                title: Text('Shop')),
            BottomNavigationBarItem(
                icon: Icon(Icons.games), 
                title: Text('Games'))
          ],
          //backgroundColor: backgroundColor,
        ));
  }

  final List<Widget> _childrenOfBottomNav = [
    GigPage(),
    GalleryPage(),
    HomePage(),
    ShopPage(),
    GamePage() 
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentBottomNavIndex = index;
    });
  }
}
