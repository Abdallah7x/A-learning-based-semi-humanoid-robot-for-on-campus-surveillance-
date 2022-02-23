import 'package:flutter/material.dart';
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
    Text('kk Screen'),
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
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("search"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Q/A"),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text("Rate us"),
                backgroundColor: Colors.red),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
