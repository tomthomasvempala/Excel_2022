import 'package:flutter/material.dart';

var DiscoverButtonData = [
  {
    "padding": EdgeInsets.fromLTRB(20, 0, 0, 0),
    "title": "Talks",
    "image": "",
    "textStyle": TextStyle(color: Color(0xFFFBFFFF)),
    "decoration": BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/discover/talks.png'), fit: BoxFit.cover),
      color: Color(0xFF0E99E8),
      borderRadius: BorderRadius.circular(24),
    ),
  },
  {
    "padding": EdgeInsets.fromLTRB(16, 0, 0, 0),
    "title": "Workshops",
    "image": "",
    "textStyle": TextStyle(color: Color(0xFFFBFFFF)),
    "decoration": BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/discover/workshops.png'),
          fit: BoxFit.cover),
      color: Color(0xFF0E99E8),
      borderRadius: BorderRadius.circular(24),
    ),
  },
  {
    "padding": EdgeInsets.fromLTRB(20, 14, 0, 0),
    "title": "Competitions",
    "image": "",
    "textStyle": TextStyle(color: Color(0xFFFBFFFF)),
    "decoration": BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/discover/competitions.png'),
          fit: BoxFit.cover),
      color: Color(0xFF0E99E8),
      borderRadius: BorderRadius.circular(24),
    ),
  },
  {
    "padding": EdgeInsets.fromLTRB(16, 14, 0, 0),
    "title": "Others",
    "image": "",
    "textStyle":
        TextStyle(color: Color(0xFF014F60), fontWeight: FontWeight.bold),
    "decoration": BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/discover/others.png'), fit: BoxFit.cover),
      color: Color(0xFF0E99E8),
      borderRadius: BorderRadius.circular(24),
    ),
  }
];
