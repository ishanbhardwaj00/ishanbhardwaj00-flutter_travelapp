import 'package:flutter/material.dart';
import 'package:fluttertravelapp/screens/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      accentColor: Color(0xFFD8ECF1),
      primaryColor: Color(0xFF3EBACE),
      scaffoldBackgroundColor: Color(0xFFF3F5F7),
    // scaffoldBackgroundColor: Colors.white,
    ),
    home: HomeApp(),
  ),
  );
}