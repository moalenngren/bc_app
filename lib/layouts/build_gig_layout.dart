import 'package:bc_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bc_app/classes.dart';
import 'package:bc_app/pages/gig_page.dart';
import 'package:bc_app/pages/gig_info_page.dart';

Container buildGigLayout(Gig gig, BuildContext context) {

//Locale myLocale = Localizations.localeOf(context);

  return Container(
    margin: EdgeInsets.only(top: 10.0),
    child:
  GestureDetector(
    onTap: (){
      /*Navigate to ... GigInfoPage(gig)*/ 
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GigInfoPage(gig: gig)),
        );
      print(gig.venue.toString()); 
    },
    child: Container(
      decoration: new BoxDecoration(
                color: yellow,
                borderRadius: new BorderRadius.all(Radius.circular(40.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25.0, top: 12.0, bottom: 12.0, right: 10.0),
            child: 
        Column(
          children: <Widget>[
            Text(DateFormat('MMM')
                    .format(DateTime.parse(gig.date)).toUpperCase(), style: TextStyle(fontFamily: "Quarca", fontSize: 22.0),),
            Text(DateFormat('dd')
                    .format(DateTime.parse(gig.date)), style: TextStyle(fontFamily: "Quarca", fontSize: 27.0, fontWeight: FontWeight.bold))
          ],
        ),),
         Container(
            margin: EdgeInsets.all(10.0),
            child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
            Text(gig.venue, style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
            Text(gig.city + ", " + /*myLocale.countryCode*/ gig.country + "jjjjjjjjjjjjjjjjjjjjjjj", style: TextStyle(fontFamily: "Quarca", fontSize: 27.0), textAlign: TextAlign.left,)
          ],
        )),
        ]),
        Container(
          height: 40.0,
          margin: EdgeInsets.only(right: 10.0),
          child:
        Image.asset("assets/images/arrow_right.png"))
        ]
      )
    )
  )
  );
}

Row buildPastGigLayout(Gig gig) {
  return /*Container(
      decoration: new BoxDecoration(
                color: darkGrey,
                borderRadius: new BorderRadius.all(Radius.circular(35.0))), 
      child:*/ Row(
        children: [
          /*Container(
            margin: EdgeInsets.only(left: 25.0, top: 12.0, bottom: 12.0, right: 10.0),
            child: 
        Column(
          children: <Widget>[ */
            Text(DateFormat('MMM')
                    .format(DateTime.parse(gig.date)) + " ", style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, color: yellow),),
            Text(DateFormat('dd')
                    .format(DateTime.parse(gig.date)) + " : ", style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, color: yellow)),
         // ],
       // ), 
        /*
        ),
         Container(
            margin: EdgeInsets.all(10.0),
            child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[ */
            Text(gig.venue + ", ", style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, color: lightGrey), textAlign: TextAlign.left,),
            Text(gig.city + ", " + gig.country.toUpperCase() + "hhhhhhhhhhhhhh", style: TextStyle(fontFamily: "Quarca", fontSize: 22.0, color: lightGrey), textAlign: TextAlign.left,)
          ],
        );
        //),
       // ]
    //  )
   // );
}


  /*
[
  {
    "id": "13722599",
    "artist_id": "438314",
    "url": "http://www.bandsintown.com/event/13722599?app_id=foo&artist=Skrillex&came_from=67",
    "on_sale_datetime": "2017-03-01T18:00:00",
    "datetime": "2017-03-19T11:00:00",
    "description": "This is a description",
    "venue": {
      "name": "Encore Beach Club",
      "latitude": "36.12714",
      "longitude": "-115.1629562",
      "city": "Las Vegas",
      "region": "NV",
      "country": "United States"
    },
    "offers": [
      {
        "type": "Tickets",
        "url": "http://www.bandsintown.com/event/13722599/buy_tickets?app_id=foo&artist=Skrillex&came_from=67",
        "status": "available"
      }
    ],
    "lineup": [
      "string"
    ]
  }
] */