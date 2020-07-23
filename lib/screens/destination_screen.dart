import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertravelapp/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DestinationScreen extends StatefulWidget {
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
  Destination destination;
  DestinationScreen({this.destination});
}

class _DestinationScreenState extends State<DestinationScreen> {

  rating(int rating) {
    String stars= ' ';
    for(int i=0; i<rating;i++)
      stars+='⭐';
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,2),
                      color: Colors.grey,
                      blurRadius: 6.0,
                    ),
                  ]
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top:50, right:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {Navigator.pop(context);},
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: () {}, ),
                        IconButton(icon: Icon(FontAwesomeIcons.filter, size: 17.0, color: Colors.black,), onPressed: () {},),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left:20,
                bottom:30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city, style: TextStyle(color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.w600),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.locationArrow, size: 12, color: Colors.white70),
                        SizedBox(width: 5.0,),
                        Text(widget.destination.country, style: TextStyle(fontSize:20,color: Colors.white70,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  right:20,
                  bottom:30,
                  child: Icon(Icons.location_on, color: Colors.white70, size:22)),
            ],
          ),
          Expanded(
            child: ListView.builder(itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Container(

                    height:180,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(140, 20, 10, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(width: 120,child: Text(activities[index].name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0, ), maxLines: 2, overflow: TextOverflow.ellipsis,)),
                              Column(
                                children: <Widget>[
                                  SizedBox(height:8.0),
                                  Text("\$${activities[index].price}", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w600),),
                                  Text("per pax", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 7.0,),
                          Text(activities[index].type, style: TextStyle(color: Colors.black54),),
                          SizedBox(height:10.0),
                          rating(activities[index].rating),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5.0),
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Theme.of(context).accentColor,
                                ),
                                  child: Text(activities[index].startTimes[0])),
                              SizedBox(width:20),
                              Container(
                                padding: EdgeInsets.all(2.0),
                                alignment: Alignment.center,
                                width: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(activities[index].startTimes[1])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left:12,
                    bottom:30,
                    child: Padding(
                      padding: EdgeInsets.only(right:30.0),
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 130,
                            height:130,
                            image: AssetImage(activities[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
              },),
          )
        ],
      ),
    );
  }
}
