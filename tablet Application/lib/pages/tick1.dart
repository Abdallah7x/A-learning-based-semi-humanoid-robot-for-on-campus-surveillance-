import 'package:flutter/material.dart';



import 'package:tablet_app/screens/sortable_page.dart';

import 'package:tablet_app/widget/tabbar_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Proctoring dates';
  
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
          Tab(icon: Icon(Icons.lock_clock), text: 'Time'),
         
        ],
        children: [
          SortablePage(),
         
        ],
      );
}
