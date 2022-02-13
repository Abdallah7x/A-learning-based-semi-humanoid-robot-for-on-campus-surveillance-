import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var data = "Navigation";
            return Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 500,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/logo/pp.jpg",
                            height: 670,
                            width: 800,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 200),
                Column(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      margin: EdgeInsets.only(right: 8, top: 8),
                      child: Image.asset(
                        "assets/images/nav.jpg",
                      ),
                    ),
                    SizedBox(height: 100),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      margin: EdgeInsets.only(right: 8, top: 8),
                      child: Image.asset(
                        "assets/images/schedules.jpg",
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
