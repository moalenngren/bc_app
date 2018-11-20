import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String gigUrl = "https://rest.bandsintown.com";
String appId = "297c11ac1d5e9ee79d6360d2123be779";

//GET UPCOMING GIGS
Future<List> getUpcomingGigs() async {
  print("API called: getUpcomingGigs()");
  var url = gigUrl + "/artists/browsingcollection/events?app_id=" + appId;
  var response = await http.get(url);

  print("Got response code: getUpcomingGigs()");
  if (response.statusCode != 200) {
    print("Not successful: " + url);
    print("Response code: " + response.statusCode.toString());
    return null;
  }

  print("Response body: " + response.body);
  /*Map<String, dynamic>*/ List responseJson = json.decode(response.body);

  return responseJson;
}

//GET PAST GIGS
Future<List> getPastGigs() async {
  print("API called: getPastGigs()");
  var url = gigUrl +
      "/artists/browsingcollection/events?app_id=" +
      appId +
      "&date=past";
  var response = await http.get(url);

  if (response.statusCode != 200) {
    print("Not successful: " + url);
    print("Response code: " + response.statusCode.toString());
    return null;
  }

  print("Response body: " + response.body);
  /*Map<String, dynamic>*/ List responseJson = json.decode(response.body);

  return responseJson;
}
