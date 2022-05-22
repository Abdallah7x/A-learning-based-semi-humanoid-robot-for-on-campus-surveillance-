import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tablet/pages/Navigation.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:tablet/pages/picture.dart';
import 'package:tablet/pages/sched2.dart';
import 'package:tablet/pages/schedule.dart';
import 'package:tablet/pages/test.dart';
import 'package:tablet/pages/tick.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _initialValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: Row(
          children: [
            Image.asset(
              "assets/logo/miu-logo.jpg",
              width: 120,
              height: 55,
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logo/pp.png",
                        height: 540,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => schedulehome2()),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Center(
                                  child: ClayContainer(
                                    color: Color(0xFFF2F2F2),
                                    height: 200,
                                    width: 210,
                                    borderRadius: 50,
                                    child: Image.asset(
                                      "assets/images/schedules.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'View schedule',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => navigation()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: ClayContainer(
                                    color: Color(0xFFF2F2F2),
                                    height: 200,
                                    width: 210,
                                    borderRadius: 50,
                                    child: Image.asset(
                                      "assets/images/nav.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Navigation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => picture()),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Center(
                                  child: ClayContainer(
                                    color: Color(0xFFF2F2F2),
                                    height: 200,
                                    width: 210,
                                    borderRadius: 50,
                                    child: Image.asset(
                                      "assets/images/picture.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Take picture',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: ClayContainer(
                                    color: Color(0xFFF2F2F2),
                                    height: 200,
                                    width: 210,
                                    borderRadius: 50,
                                    child: Image.asset(
                                      "assets/images/t.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ticket history',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
