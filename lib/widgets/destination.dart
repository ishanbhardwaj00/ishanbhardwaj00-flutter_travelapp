import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertravelapp/models/destination_model.dart';
import 'package:fluttertravelapp/models/activity_model.dart';
import 'package:fluttertravelapp/screens/destination_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  int index=0;
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Top Destinations", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0, letterSpacing: 1.5),),
                  GestureDetector(
                      onTap: () => print("See all"),
                      child: Text("See all", style: TextStyle(fontSize: 15.0, fontWeight:FontWeight.w600, color: Colors.cyan),)),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: destinations.length,itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return DestinationScreen(destination:destinations[index]);
                    }));
                  });
                },
                child: Container(

                  width: 210,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom:20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: 220,
                          height:120,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("${activities.length} activities", style: TextStyle(fontSize: 24.0, letterSpacing: 1.2, fontWeight: FontWeight.bold),),
                                Text(destinations[index].description, style: TextStyle( color: Colors.black54),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,2),
                              blurRadius:5.0,
                              color: Colors.grey,
                            ),
                          ],
                        color: Colors.white,
                        ),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: destinations[index].imageUrl,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                fit: BoxFit.cover,
                                height: 180,
                                width: 180,
                                image: AssetImage(destinations[index].imageUrl),
                              ),
                            ),
                          ),
                          Positioned(
                            left:10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(destinations[index].city, style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600),),
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.locationArrow, size: 10, color: Colors.white),
                                    SizedBox(width: 5.0,),
                                    Text(destinations[index].country, style: TextStyle(color: Colors.white                                ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } ),
        ),
      ],
    );
  }
}
