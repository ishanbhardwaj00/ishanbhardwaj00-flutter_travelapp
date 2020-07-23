import 'package:flutter/material.dart';
import 'package:fluttertravelapp/models/destination_model.dart';
import 'package:fluttertravelapp/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Hotels extends StatefulWidget {
  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
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
                  Text("Exclusive Hotels", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0, letterSpacing: 1.5),),
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
          child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: hotels.length,itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                width: 240,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom:30,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: 240,
                        height:120,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("${hotels[index].name}, ${hotels[index].address}", style: TextStyle(fontSize: 16.0, letterSpacing: 1.2, fontWeight: FontWeight.bold),),
                              //Text(hotels[index].address, style: TextStyle( color: Colors.black54),),
                              SizedBox(height: 10,),
                              Text("\$${hotels[index].price}/night", style: TextStyle(color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w600),),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              fit: BoxFit.cover,
                              height: 180,
                              width: 220,
                              image: AssetImage(hotels[index].imageUrl),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } ),
        ),
      ],
    );
  }
}
