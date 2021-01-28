import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url : 'Europe/Istanbul,', location: 'Istanbul', flag: 'turkey.png' ),
    WorldTime(url : 'Europe/London,', location: 'London', flag: 'uk.png' ),
    WorldTime(url : 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png' ),
    WorldTime(url : 'Asia/Jakarta,', location: 'Jakarta', flag: 'indonesia.png' ),
    WorldTime(url : 'America/Chicago,', location: 'Chicago', flag: 'uk.png' ),
    WorldTime(url : 'Europe/Berlin,', location: 'Berlin', flag: 'germany.png' ),

  ];
  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'Choose a location',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),

        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap:(){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage( 'assets/${locations[index].flag}'),
                  ),
                ),

              ),
            );
          },
        )
    );
  }
}
