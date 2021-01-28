import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time;     // time in that location
  String flag; // Ure to asset flag icon
  String url; // location url for api end points
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future <void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime= data ['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    isDaytime= now.hour > 6 && now.hour <20 ? true : false;
    time = DateFormat.jm().format(now);

  }


}

