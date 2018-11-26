import 'package:flutter/material.dart';
import 'package:bc_app/api.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/pages/gallery_page.dart';
import 'package:bc_app/pages/gig_page.dart';
import 'package:bc_app/pages/shop_page.dart';
import 'package:bc_app/pages/game_page.dart';
import 'package:bc_app/pages/home_page.dart';
import 'package:bc_app/classes.dart';
import 'package:intl/intl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Browsing Collection App",
      theme: new ThemeData(
          canvasColor: bottomNavBarColor, //bottom nav bar
          //brightness: Brightness.light, //Brightness of icon text
          //accentColorBrightness: Brightness.dark, 
          accentColor: Colors.black,//Icons text when chosen & numberpicker text
          textTheme: Theme.of(context).textTheme.apply(
                displayColor: darkGrey, //Icons text when NOT chosen
                //fontFamily: "Quarca",
                
              )
              ),
      home: new LogInPage(title: 'Log In'),
    );
  }
}

class LogInPage extends StatefulWidget {
  LogInPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LogInPageState createState() => new _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  
  bool loggedIn = true;
  int _currentBottomNavIndex = 2; 
  List<Gig> allUpcomingGigInstances = [];
  List<Gig> allPastGigInstances = [];
  User user = User("bc_fan_93", 0, 0, []); //Get this from real log in

 @override
  void initState() {
    super.initState();
    getGigs();
  }

  Future getGigs() async {
    print("Getting gigs");
    List fetchedUpcomingGigs = await getUpcomingGigs();
    await setGigs(fetchedUpcomingGigs, true);
    List fetchedPastGigs = await getPastGigs();
    print("FETCHED PAST GIGS IS : " + fetchedPastGigs.length.toString());
    await setGigs(fetchedPastGigs, false);
  }

   setGigs(List fetchedGigs, bool isUpcoming) {
    print("Setting gigs");
    if (fetchedGigs != null || fetchedGigs != []) {
      for (var gig in fetchedGigs) {
        //print("gig is "+ gig["venue"]["name"]);
        Gig newGig = new Gig(
            gig["venue"]["name"] != null ? gig["venue"]["name"] : "Unknown title",
            gig["venue"]["city"] != null ? gig["venue"]["city"] : "Unknown city",
            gig["venue"]["country"] != null ? gig["venue"]["country"] : "",
            gig["venue"]["latitude"] != null ? gig["venue"]["latitude"] : "",
            gig["venue"]["longitude"] != null ? gig["venue"]["longitude"] : "",
            gig["offers"].length != 0 && gig["offers"] != [] && gig["offers"] != null ? gig["offers"][0]["type"] : "",
            gig["offers"].length != 0 && gig["offers"] != [] && gig["offers"] != null ? gig["offers"][0]["url"] : "",
            gig["datetime"] != null ? gig["datetime"] : "",
            gig["description"] != null ? gig["description"] : "Live show with Browsing Collection",
            gig["lineup"] != null ? gig["lineup"] : ["Browsing Collection"]); 

            if (isUpcoming) {
              allUpcomingGigInstances.add(newGig);
              print("Adding upcoming gig");
            } else {
              allPastGigInstances.add(newGig);
              print("Adding past gig");
            }  
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    //IF LOGGED IN
    Widget _buildLoggedIn() {
      final List<Widget> _childrenOfBottomNav = [
        GigPage(
          upcomingGigList: allUpcomingGigInstances,
          pastGigList: allPastGigInstances),
        GalleryPage(),
        HomePage(user: user),
        ShopPage(),
        GamePage()
      ];

      return Scaffold(
       /* appBar: new AppBar(
          title: apptitle("Browsing Collection"),
          backgroundColor: appBarColor,
        ), */
        body: _childrenOfBottomNav[_currentBottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentBottomNavIndex,
          items: [
            BottomNavigationBarItem(
              icon: gigsIcon,
              title: new Text('Gigs'),
            ),
            BottomNavigationBarItem(
              icon: galleryIcon,
              title: new Text('Gallery'),
            ),
            BottomNavigationBarItem(
                icon: homeIcon, 
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: shopIcon, 
                title: Text('Shop')),
            BottomNavigationBarItem(
                icon: gamesIcon, 
                title: Text('Games'))
          ],
          //backgroundColor: backgroundColor,
        ));
    }

    Widget _buildNotLoggedIn() {
      return new Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Welcome, push the button to log in',
              style: new TextStyle(color: darkWhite, fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: new Icon(Icons.arrow_right),
            ),
          ],
        ),
      )
    );
    }

    if (loggedIn) {
      //IF LOGGED IN
      print("Logged in");
      return _buildLoggedIn();
    } else {
      //IF NOT LOGGED IN
      print("Not logged in");
      return _buildNotLoggedIn();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentBottomNavIndex = index;
    });
  }
}