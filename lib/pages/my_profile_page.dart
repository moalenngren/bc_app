import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/classes.dart';
import 'package:bc_app/layouts/build_fan_item_layout.dart';

class MyProfilePage extends StatefulWidget {
  MyProfilePage({Key key}) : super(key: key);

  @override
  _MyProfilePageState createState() => new _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  List<FanItem> allFanItemsRow1 = [
    new FanItem("Concert seen" /*seen*/, "assets/images/members_icon.png", 2),
    new FanItem("Videos watched" /*watched*/, "assets/images/members_icon.png", 6),
    new FanItem("Songs streamed" /*streamed*/, "assets/images/members_icon.png", 34),
  ];
  List<FanItem> allFanItemsRow2 = [
    new FanItem("Games played" /*played*/, "assets/images/members_icon.png", 59),
    new FanItem("Friends invited" /*invited*/, "assets/images/members_icon.png", 1),
    new FanItem("Merch ordered"/* ordered*/, "assets/images/members_icon.png", 2),
  ];


  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    List<Widget> rowList1 = [];
    List<Widget> rowList2 = [];

    //PROFILE PIC TODO - Get from real user
    widgetList.add(Container(
      margin: EdgeInsets.all(20.0),
      child: Image.asset("assets/images/profile_placeholder.png"),
      height: 200.0,
    ));

    //POINTS LABEL
    widgetList.add(smallButton("530 XP", darkGrey, yellow, () {
      print("Clicked points");
    }));

//FAN STAGE LABEL
    widgetList.add(fanStageLabel("Extreme Admirer")
);

    //FAN ITEM LIST 1
    for (FanItem item in allFanItemsRow1) {
      rowList1.add(buildFanItemLayout(item));
    } 

    widgetList.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowList1
      ,)
    );

  //FAN ITEM LIST 2
    for (FanItem item in allFanItemsRow2) {
      rowList2.add(buildFanItemLayout(item));
    } 

    widgetList.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowList2
      ,)
    );

     widgetList.add(fanStageLabel("Inventory") //TODO - Put in user data
     //TODO - Add found gems, coins, medals(?) and other stuff here
);

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("My Backstage"),
        backgroundColor: appBarColor,
        actions: <Widget> [appBarIconsInfo(context), appBarIconsSettings(context)],
      ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}
