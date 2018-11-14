import 'package:flutter/material.dart';
import 'package:bc_app/styles.dart';
import 'package:bc_app/api.dart';
import 'package:bc_app/layouts/build_gig_layout.dart';
import 'package:bc_app/layouts/common_layouts.dart';

class Gig {
  String venue;
  String city;
  String country;
  String latitude;
  String longitude;
  String type;
  String ticketLink;
  String date;
  String description;
  List lineup;

  Gig(this.venue, this.city, this.country, this.latitude, this.longitude,
      this.type, this.ticketLink, this.date, this.description, this.lineup);
}

class GigPage extends StatefulWidget {
  GigPage({Key key, this.title, this.upcomingGigList, this.pastGigList})
      : super(key: key);
  final String title;
  final List<Gig> upcomingGigList;
  final List<Gig> pastGigList;

  @override
  _GigPageState createState() => new _GigPageState();
}

class _GigPageState extends State<GigPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    //UPCOMING GIGS
    widgetList.add(headerText("UPCOMING GIGS"));
    if (widget.upcomingGigList != null || widget.upcomingGigList.length > 0) {
      print("Upcoming gigs are loaded");
      print("Length of gigs in upcoming giglist is: " +
          widget.upcomingGigList.length.toString());

      widget.upcomingGigList.sort((b, a) {
        return a.date.toLowerCase().compareTo(b.date.toLowerCase());
      });

      for (Gig gig in widget.upcomingGigList) {
        print("Building gig layouts");
        widgetList.add(buildGigLayout(gig));
      }
    } else {
      print("Upcoming gigs failed to load or are empty");
      widgetList.add(subHeaderText("Unable to load upcoming gigs..."));
    }

    //PAST GIGS
    widgetList.add(headerText("PAST GIGS"));
    if (widget.pastGigList != null && widget.pastGigList.length > 0) {
      print("Past gigs are loaded");
      print("Length of gigs in past giglist is: " +
          widget.pastGigList.length.toString());

      widget.pastGigList.sort((b, a) {
        return a.date.toLowerCase().compareTo(b.date.toLowerCase());
      });

      for (Gig gig in widget.pastGigList) {
        widgetList.add(buildPastGigLayout(gig));
      }
    } else {
      widgetList.add(subHeaderText(
          "Unable to load past gigs... \n Check your internet connection!"));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: apptitle("Gigs"),
        backgroundColor: appBarColor,
      ),
      body: ListView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          children: widgetList),
      backgroundColor: backgroundColor,
    );
  }
}
