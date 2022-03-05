import 'package:flutter/material.dart';
import 'package:tablet/pages/HomePage.dart';
import 'package:tablet/pages/nav.dart';
import 'package:tablet/pages/cam.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tablet/pages/sortable_page.dart';
import 'package:tablet/pages/sortable_page2.dart';
import 'package:tablet/pages/sortable_page3.dart';
import 'package:tablet/widget/tabbar_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Tickets';
  final _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: title,
        // theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) =>
      // Nav();
      TabBarWidget(
        title: MyApp.title,
        tabs: [
          Tab(icon: Icon(Icons.add_alert), text: 'Fighting'),
          Tab(icon: Icon(Icons.smoke_free), text: 'Smoking'),
          Tab(icon: Icon(Icons.add_alert), text: 'Playing cards'),
        ],
        children: [
          SortablePage(),
          SortablePage2(),
          SortablePage3(),
        ],
      );
}
