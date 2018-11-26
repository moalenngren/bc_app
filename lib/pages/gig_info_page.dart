import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/classes.dart';
import 'package:bc_app/layouts/common_layouts.dart';
import 'package:bc_app/pages/gig_page.dart';
import 'package:intl/intl.dart';

class GigInfoPage extends StatefulWidget {
  GigInfoPage({Key key, this.title, this.gig}) : super(key: key);
  final String title;
  final Gig gig;

  @override
  _GigInfoPageState createState() => new _GigInfoPageState();
}

class _GigInfoPageState extends State<GigInfoPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    Row buildInfoRow(String left, String right) {
      return 
      Row(
        children: <Widget>[
        Text(
          left,
          style: TextStyle(
              fontFamily: "Quarca",
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        Text(
          right,
          style: TextStyle(fontFamily: "Quarca", fontSize: 22.0),
        ),
      ]);
    }

    widgetList.add(headerText(
        widget.gig.venue != null ? widget.gig.venue : "LIVE CONCERT"));
    widgetList.add(subHeaderText(
        widget.gig.description != null || widget.gig.description != ""
            ? widget.gig.description
            : "Live show with Browsing Collection"));

    List<Widget> infoList = [
      buildInfoRow("Date: ",
          DateFormat('MMM dd').format(DateTime.parse(widget.gig.date))),
      buildInfoRow(
          "Time: ", DateFormat('H:mm').format(DateTime.parse(widget.gig.date))),
      buildInfoRow("Venue: ", widget.gig.venue),
      buildInfoRow("Location: ", widget.gig.city + ", " + widget.gig.country),
    ];

    String bandList = "Browsing Collection";
    for (String band in widget.gig.lineup) {
      if (band != "Browsing Collection") {
        bandList += ", " + band;
      }
    }

    infoList.add(
      buildInfoRow("Lineup: ", bandList),
    );

    infoList.add(
      buildInfoRow("Entrance: ", widget.gig.type),
    );

    if (widget.gig.ticketLink ==
        "No link found. Sorry, you'll have to Google it!") {
      infoList.add(GestureDetector(
        onTap: () => print("Go to website..."),
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          decoration: new BoxDecoration(
              color: yellow,
              borderRadius: new BorderRadius.all(Radius.circular(10.0))),
          child: Text("BUY TICKET",
              style: TextStyle(
                  fontFamily: "Quarca",
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
        ),
      ));
    }

    Container gigInfoContainer = Container(
      decoration: new BoxDecoration(
          color: darkWhite,
          borderRadius: new BorderRadius.all(Radius.circular(10.0))),
      padding: EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: infoList),
    );

    widgetList.add(gigInfoContainer);

    widgetList.add(GestureDetector(
      onTap: ()=> print("CHECK IN"),
      child: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          decoration: new BoxDecoration(
              color: yellow, //TODO - make this grey if location is not nere and date is wrong
              borderRadius: new BorderRadius.all(Radius.circular(40.0))),
          child: Text("CHECK IN",
              style: TextStyle(
                  fontFamily: "Quarca",
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ),
      
    ));

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Gig Info"),
        backgroundColor: appBarColor,
      ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}
