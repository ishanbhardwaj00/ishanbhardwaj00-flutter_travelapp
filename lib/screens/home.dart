import 'package:flutter/material.dart';
import 'package:fluttertravelapp/models/hotel_model.dart';
import 'package:fluttertravelapp/widgets/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/destination.dart';
import "../widgets/hotels.dart";

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int sIndex=0;
  bool flag=true;
  List<IconData> icon = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personBooth,
    FontAwesomeIcons.biking,
  ];
  int index=0;
  int currentValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 30.0),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20.0, right: 100.0),
                child: Text("What would you like to find?", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(

                height: 50.0,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: icon.length ,itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        sIndex=index;
                        }
                      );
                   },
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 10.0),
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: sIndex==index ? Theme.of(context).accentColor: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: IconButton(
                          icon: FaIcon(icon[index], color: sIndex==index? Theme.of(context).primaryColor: Colors.blueGrey,),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Destination(),
            Hotels(),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );

}
}
