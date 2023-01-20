import 'package:flutter/material.dart';

List<Widget> navScreens = [
  Container(),
  Container(),
  Container(),
];

const navItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'Business',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.school),
    label: 'School',
  ),
];
