import 'package:flutter/material.dart';



class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentValue=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentValue,
      onTap: (int val) { setState(() {
        currentValue=val;
      }); },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_pizza),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 15.0,
            backgroundImage: NetworkImage("https://instagram.fdel5-1.fna.fbcdn.net/v/t51.2885-19/s320x320/81407432_2509371392651378_4187925032967602176_n.jpg?_nc_ht=instagram.fdel5-1.fna.fbcdn.net&_nc_ohc=DgKWEdFywUEAX_n-PC3&oh=8e8bb87dbee014b579842289f50e4291&oe=5F1B9B51"),),
          title: SizedBox.shrink(),
        )
      ],
    );
  }
}
