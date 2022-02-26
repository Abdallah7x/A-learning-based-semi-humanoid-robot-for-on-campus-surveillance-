import 'package:flutter/material.dart';
import 'package:tablet/pages/rating.dart';
import 'package:tablet/pages/search.dart';

import 'HomePage.dart';
import 'faq.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    search(),
    FAQ(),
    ReviewsDemo(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedFontSize: 22,
          unselectedFontSize: 15,
          selectedItemColor: Colors.red.shade800,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.red.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "search",
                backgroundColor: Colors.red.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Q/A",
                backgroundColor: Colors.red.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: "Rate us",
                backgroundColor: Colors.red.shade800),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
